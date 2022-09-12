# frozen_string_literal: true

require_relative 'carserv/public_api/client/config'
require_relative 'carserv/public_api/client/authenticator'
require_relative 'carserv/public_api/client/base'
require_relative 'carserv/public_api/client/repair_order'
require_relative 'carserv/public_api/client/customer'
require_relative 'carserv/public_api/client/errors/rate_limit_error'
require_relative 'carserv/public_api/client/version'
require_relative 'carserv/public_api/client/globals'
require_relative 'carserv/public_api/client/vehicle'
require_relative 'carserv/public_api/client/service_advisor'
require_relative 'carserv/public_api/client/appointment'

module Carserv
  module PublicApi
    # Client
    module Client
      attr_accessor :config

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
