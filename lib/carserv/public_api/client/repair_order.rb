# frozen_string_literal: true

require_relative 'base'
require_relative 'authenticator'

module Carserv
  module PublicApi
    module Client
      class RepairOrder < Carserv::PublicApi::Client::Base
        class << self
          def list(start_date:, end_date:, page: 1)
            request do
              includes(:customer)
                .with_params(from: start_date, to: end_date).page(page).all
            end
          end

          def fetch(id:)
            request do
              includes(:appointment, :customer, :vehicle, :repair_shop, :service_advisor, :technician, :inspections)
                .find(id).first
            end
          end
        end
      end
    end
  end
end
