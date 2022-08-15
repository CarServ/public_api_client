# frozen_string_literal: true

require 'json_api_client'

module Carserv
  module PublicApi
    module Client
      class Base < JsonApiClient::Resource
        self.raise_on_blank_find_param = true
        self.site = 'http://localhost:3000/public/api/v2/'
        connection_options[:status_handlers] = {
          429 => ->(env) { raise Carserv::PublicApi::Client::Errors::RateLimitError, env }
        }

        class << self
          def list(page: 1)
            request do
            end
          end

          def fetch(id:)
            request do
            end
          end

          def request(&block)
            attempts ||= 0
            with_headers(Authorization: "Bearer #{token}") do
              yield block
            end
          rescue JsonApiClient::Errors::InternalServerError
            error_response({ status: 500 })
          rescue JsonApiClient::Errors::NotAuthorized
            error_response({ status: 401 })
          rescue JsonApiClient::Errors::NotFound
            error_response({ status: 404 })
          rescue JsonApiClient::Errors::RequestTimeout
            if (attempts += 1) < 2
              sleep 5
              retry
            end
            error_response({ status: 408 })
          rescue Carserv::PublicApi::Client::Errors::RateLimitError => e
            e.check_retry({ retry_count: attempts += 1 }) ? retry : error_response({ status: 429 })
          end

          def error_response(status:)
            case status
            when 500
              message = 'Internal Server Error!'
            when 401
              message = 'Not Authorized!'
            when 404
              message = 'Not Found!'
            when 408
              message = 'Request Timeout!'
            when 429
              message = 'Too Many Requests!'
            end
            { status: status, message: message }
          end

          def token
            Carserv::PublicApi::Client::Authenticator.access_token
          end
        end
      end
    end
  end
end
