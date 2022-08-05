# frozen_string_literal: true

require_relative 'base'
require_relative 'config'

module Carserv
  module PublicApi
    module Client
      class RepairOrder < Carserv::PublicApi::Client::Base
        class << self
          def list(page: 1)
            request do
              puts Carserv::PublicApi::Client::Config.api_key
              puts "Hello from lister"
            end
          end

          def fetch(id:)
            request do
              puts "Hello from fetcher"
            end
          end
        end
      end
    end
  end
end