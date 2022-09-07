# frozen_string_literal: true

module Carserv
  module PublicApi
    module Client
      # RepairOrder
      class RepairOrder < Carserv::PublicApi::Client::Base
        class << self
          def list(start_date:, end_date:, page: 1)
            params = {}
            params[:filter] = {}
            params[:filter][:closed_at] = { from: start_date, to: end_date }
            request do
              includes(:appointment, :customer, :vehicle, :repair_shop, :service_advisor, :technician)
                .with_params(params).page(page).all
            end
          end

          def fetch(id:)
            request do
              includes(:appointment, :customer, :vehicle, :repair_shop, :service_advisor, :technician)
                .find(id).first
            end
          end
        end
      end
    end
  end
end
