# frozen_string_literal: true

module Carserv
  module PublicApi
    module Client
      # Customer
      class Customer < Carserv::PublicApi::Client::Base
        belongs_to :repair_order, shallow_path: true

        class << self
          def list(options: {}, page: 1)
            params = {}
            params[:filter] = options.present? && options[:filter].present? ? options[:filter] : {}

            request do
              with_params(params).page(page).all
            end
          end

          def fetch(id:)
            request do
              includes(:appointments, :jobs, :vehicles)
                .find(id).first
            end
          end
        end
      end
    end
  end
end
