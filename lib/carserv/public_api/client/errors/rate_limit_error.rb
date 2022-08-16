# frozen_string_literal: true

require 'json_api_client'

module Carserv
  module PublicApi
    module Client
      module Errors
        # RateLimitError
        class RateLimitError < JsonApiClient::Errors::TooManyRequests
          attr_reader :env

          def initialize(env)
            @env = env
            super
          end

          def check_retry(retry_count:)
            case retry_count
            when 1
              wait_for(interval: 5)
            when 2
              wait_for(interval: 10)
            when 3
              wait_for(interval: 15)
            else
              false
            end
          end

          def wait_for(interval:)
            sleep interval
            true
          end
        end
      end
    end
  end
end
