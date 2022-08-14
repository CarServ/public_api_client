# frozen_string_literal: true

require 'json_api_client'
require_relative 'errors/rate_limit_error'

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

          def request
            attempts ||= 0
            yield
          rescue JsonApiClient::Errors::InternalServerError
            handle_error_response({ status: 500, message: 'Internal Server Error!' })
          rescue JsonApiClient::Errors::NotAuthorized
            handle_error_response({ status: 401, message: 'Not Authorized!' })
          rescue JsonApiClient::Errors::NotFound
            handle_error_response({ status: 404, message: 'Not Found!' })
          rescue JsonApiClient::Errors::RequestTimeout
            if (attempts += 1) < 2
              sleep 5
              retry
            end
            handle_error_response({ status: 408, message: 'Request Timeout!' })
          rescue Carserv::PublicApi::Client::Errors::RateLimitError => e
            if e.check_retry({ retry_count: attempts += 1 })
              retry
            else
              handle_error_response({ status: 429, message: 'Too Many Requests!' })
            end
          end

          def handle_error_response(status:, message:)
            { status: status, message: message }
          end
        end
      end
    end
  end
end
