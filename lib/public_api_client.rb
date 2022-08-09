# frozen_string_literal: true

require_relative 'carserv/public_api/client/config'

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
