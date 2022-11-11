# frozen_string_literal: true

module Carserv
  module PublicApi
    module Client
      # RepairOrder
      class RepairOrder < Carserv::PublicApi::Client::Base
        belongs_to :repair_shop, shallow_path: true

        class << self
          def list(start_time: nil, end_time: nil, page: 1)
            params = {}

            if start_time.present? && end_time.present?
              params[:filter] = {}
              params[:filter][:closed_at] = { from: start_time, to: end_time }
            end

            request do
              with_params(params).page(page).all
            end
          end

          def fetch(id:)
            request do
              includes(:appointment, :customer, :vehicle, :repair_shop,
                       :service_advisor, :technician, :inspections, operations: %i[parts labors sublets others])
                .find(id).first
            end
          end
        end
      end
    end
  end
end
