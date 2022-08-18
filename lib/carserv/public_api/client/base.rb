# frozen_string_literal: true

require 'json_api_client'
require_relative 'globals'

module Carserv
  module PublicApi
    module Client
      # Base
      class Base < JsonApiClient::Resource
        self.raise_on_blank_find_param = true
        self.site = Carserv::PublicApi::Client::PUBLIC_API_BASE_URL
        connection_options[:status_handlers] = {
          429 => ->(env) { raise Carserv::PublicApi::Client::Errors::RateLimitError, env }
        }

        class << self
          def list(*)
            request do
            end
          end

          def fetch(*)
            request do
            end
          end

          def request(&block)
            attempts ||= 0
            with_headers('Authorization': "Bearer #{token}", 'Content-Type': 'application/json') do
              yield block
            end
          rescue JsonApiClient::Errors::ClientError
            error_response({ status: 400 })
          rescue JsonApiClient::Errors::InternalServerError
            error_response({ status: 500 })
          rescue JsonApiClient::Errors::NotAuthorized => e
            (attempts += 1) < 2 ? (refresh_access_token && retry) : error_response({ status: 401 })
          rescue JsonApiClient::Errors::NotFound
            error_response({ status: 404 })
          rescue JsonApiClient::Errors::RequestTimeout
            (attempts += 1) < 2 ? (sleep(5) && retry) : error_response({ status: 408 })
          rescue Carserv::PublicApi::Client::Errors::RateLimitError => e
            e.check_retry({ retry_count: attempts += 1 }) ? retry : error_response({ status: 429 })
          end

          def error_response(status:)
            case status
            when 400
              message = 'Bad request!'
            when 401
              message = 'Not Authorized!'
            when 404
              message = 'Not Found!'
            when 408
              message = 'Request Timeout!'
            when 429
              message = 'Too Many Requests!'
            when 500
              message = 'Internal Server Error!'
            end
            { status: status, message: message }
          end

          def token
            Carserv::PublicApi::Client::Authenticator.access_token
          end

          def refresh_access_token
            Carserv::PublicApi::Client::Authenticator.refresh_access_token
          end
        end
      end
    end
  end
end
