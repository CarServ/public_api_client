# frozen_string_literal: true

module Carserv
  module PublicApi
    module Client
      # Vehicle
      class Vehicle < Carserv::PublicApi::Client::Base
        belongs_to :repair_order, shallow_path: true
        class << self
          def list(start_date:, end_date:, page: 1)
            with_params(from: start_date, to: end_date).page(page).all
          end

          def fetch(id:)
            find(id).first
          end
        end
      end
    end
  end
end
