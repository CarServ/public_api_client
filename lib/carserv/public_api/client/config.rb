# frozen_string_literal: true

require 'faraday'

module Carserv
  module PublicApi
    module Client
      class Config
        DEFAULT_ITEMS_PER_PAGE = 50

        attr_accessor :api_key, :api_secret, :faraday_adapter, :items_per_page

        def initialize
          @api_key = nil
          @api_secret = nil
          @faraday_adapter = Faraday.default_adapter
          @items_per_page = DEFAULT_ITEMS_PER_PAGE
        end
      end
    end
  end
end
