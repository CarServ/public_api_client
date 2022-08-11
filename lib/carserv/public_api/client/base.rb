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
            yield
          rescue JsonApiClient::Errors::AccessDenied
            puts 'Access Denied!'
          rescue JsonApiClient::Errors::BadGateway
            puts 'BadGateway!'
          rescue JsonApiClient::Errors::GatewayTimeout
            puts 'Gateway Timeout!'
          rescue JsonApiClient::Errors::InternalServerError
            puts 'Internal Server Error!'
          rescue JsonApiClient::Errors::NotAuthorized
            puts 'Not Authorized!'
          rescue JsonApiClient::Errors::NotFound
            puts 'Not Found!'
          rescue JsonApiClient::Errors::RequestTimeout
            puts 'Request Timeout!'
          rescue JsonApiClient::Errors::TooManyRequests
            puts 'Too Many Requests!'
          rescue Net::OpenTimeout, Net::ReadTimeout
            puts 'Oepn/Read Timeout!'
          rescue Carserv::PublicApi::Client::Errors::RateLimitError
            # ... track which attempt this is,
            # ... if it's the 1st attempt, sleep 30 seconds and try again
            # ... if it's the 2nd attempt, sleep 60 seconds and try again
            # ... if it's the 3rd attempt, sleep 3 minutes and try again
            # ... if it's the 4th attempt, re-raise the error
          end
        end
      end
    end
  end
end