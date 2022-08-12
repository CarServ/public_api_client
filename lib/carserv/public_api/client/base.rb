# frozen_string_literal: true

require 'json_api_client'

module Carserv
  module PublicApi
    module Client
      class Base < JsonApiClient::Resource
        self.raise_on_blank_find_param = true
        self.site = 'http://localhost:3000/public/api/v2/'

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
          rescue JsonApiClient::Errors::TooManyRequests
            handle_error_response({ status: 429, message: 'Too Many Requests!' })
          # rescue Carserv::PublicApi::Client::Errors::RateLimitError
            # ... track which attempt this is,
            # ... if it's the 1st attempt, sleep 30 seconds and try again
            # ... if it's the 2nd attempt, sleep 60 seconds and try again
            # ... if it's the 3rd attempt, sleep 3 minutes and try again
            # ... if it's the 4th attempt, re-raise the error
          end

          def handle_error_response(status:, message:)
            { status: status, message: message }
          end
        end
      end
    end
  end
end
