# frozen_string_literal: true

module Carserv
  module PublicApi
    module Client
      # RepairShop
      class RepairShop < Carserv::PublicApi::Client::Base
        class << self
          def fetch(id:)
            request do
              find(id).first
            end
          end
        end
      end
    end
  end
end
