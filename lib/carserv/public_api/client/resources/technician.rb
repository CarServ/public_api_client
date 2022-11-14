# frozen_string_literal: true

module Carserv
  module PublicApi
    module Client
      # Technician
      class Technician < Carserv::PublicApi::Client::Base
        belongs_to :repair_shop, shallow_path: true

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
