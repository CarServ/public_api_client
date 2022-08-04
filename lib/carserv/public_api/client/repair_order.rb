# frozen_string_literal: true

require_relative 'base'

module Carserv
  module PublicApi
    module Client
      class RepairOrder < Carserv::PublicApi::Client::Base
        class << self
          def list(page: 1)
            request do
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