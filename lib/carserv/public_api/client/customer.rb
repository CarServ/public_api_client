# frozen_string_literal: true

module Carserv
  module PublicApi
    module Client
      # Customer
      class Customer < Carserv::PublicApi::Client::Base
        class << self
          def list(page: 1)
            request do
              page(page).all
            end
          end

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
