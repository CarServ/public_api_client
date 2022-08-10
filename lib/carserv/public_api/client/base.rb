# frozen_string_literal: true

require 'json_api_client'

module Carserv
  module PublicApi
    module Client
      class Base < JsonApiClient::Resource
        self.site = 'http://localhost:3000'
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
          rescue Net::OpenTimeout, Net::ReadTimeout
            # ... sleep 5 seconds and try again
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