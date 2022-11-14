# frozen_string_literal: true

module Carserv
  module PublicApi
    module Client
      # Operation
      class Operation < Carserv::PublicApi::Client::Base
        belongs_to :repair_order, shallow_path: true

        class << self
          def list(options:, page: 1)
            params = {}
            params = check_and_set_filters(options) if options[:filter][:job_id] || options[:filter][:job_number]

            request do
              includes(%i[parts labors sublets others]).with_params(params).page(page).all
            end
          end

          def check_and_set_filters(options)
            params = {}
            params[:filter] = {}
            params[:filter][:job_id] = options[:filter][:job_id]
            params[:filter][:job_number] = options[:filter][:job_number]

            params
          end
        end
      end
    end
  end
end
