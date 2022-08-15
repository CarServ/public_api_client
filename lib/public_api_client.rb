# frozen_string_literal: true

require_relative 'carserv/public_api/client/config'
require_relative 'carserv/public_api/client/authenticator'
require_relative 'carserv/public_api/client/base'
require_relative 'carserv/public_api/client/repair_order'
require_relative 'carserv/public_api/client/errors/rate_limit_error'

module Carserv
  module PublicApi
    module Client
      class << self
        attr_accessor :config
      end

      def self.config
        @config ||= Config.new
      end

      def self.reset
        @config = Config.new
      end

      def self.configure
        yield(config)
      end
    end
  end
end
