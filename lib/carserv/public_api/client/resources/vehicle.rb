# frozen_string_literal: true

module Carserv
  module PublicApi
    module Client
      # Vehicle
      class Vehicle < Carserv::PublicApi::Client::Base
        belongs_to :repair_order, shallow_path: true

        class << self
          def list(options:, page: 1)
            params = {}

            if options[:filter][:customer_id].present?
              params[:filter] = {}
              params[:filter][:customer_id] = options[:filter][:customer_id]
            end

            request do
              includes(:customer)
                .with_params(params).page(page).all
            end
          end

          def fetch(id:)
            request do
              includes(:customer)
                .find(id).first
            end
          end
        end
      end
    end
  end
end
