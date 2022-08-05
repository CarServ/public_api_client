# frozen_string_literal: true

# TODO

require_relative 'config'

module Carserv
  module PublicApi
    module Client
      class RateLimiter
        TIME_PERIOD = 60
        LIMIT = 20

        def check_limit
          if should_allow?(env)
            true
          else
            request_limit_exceeded
          end
        end

        private

        def should_allow?
          requests_within_limit? ? true : false
        end

        def requests_within_limit?
          key = "#{}"

          REDIS.set(key, 0, nx: true, ex: TIME_PERIOD)
          REDIS.incr(key) > LIMIT ? false : true
        end

        def request_limit_exceeded
          [429, {}, ['Too many requests. Request limit exceeded!']]
        end
      end
    end
  end
end
