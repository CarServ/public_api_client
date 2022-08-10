# frozen_string_literal: true

require_relative 'config'
require 'faraday'
require 'faraday/net_http'
require 'redis'
Faraday.default_adapter = :net_http

module Carserv
  module PublicApi
    module Client
      class Authenticator
        class << self
          def access_token
            fetch_access_token
          end

          def refresh_access_token
            new_access_token
          end

          private

          def fetch_access_token
            token = redis.hget(cache_key, :access_token)
            token || new_access_token
          end

          def cache_access_token(token)
            redis.hset(cache_key, :access_token, token)
          end

          def new_access_token
            request do
              new_token = request_access_token
              cache_access_token(new_token) if new_token
              new_token
            end
          end

          def request_access_token
            url = 'http://localhost:3000'
            api_key = Carserv::PublicApi::Client.config.api_key
            api_secret = Carserv::PublicApi::Client.config.api_secret

            return nil if api_key.empty? || api_secret.empty?

            conn = Faraday.new(url: url, headers: { 'Content-Type' => 'application/json' })
            response = conn.post('/public/api/v2/access_token.json') do |req|
              req.body = { key: api_key, secret: api_secret }.to_json
            end
            response_body = JSON.parse(response.body)
            response_body['jwt'] || nil
          end

          def cache_key
            "access_token_#{Carserv::PublicApi::Client.config.api_key}"
          end

          def redis
            Redis.new
          end

          def request
            yield
          rescue Net::OpenTimeout, Net::ReadTimeout
          end
        end
      end
    end
  end
end
