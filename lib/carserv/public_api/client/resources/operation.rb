# frozen_string_literal: true

module Carserv
  module PublicApi
    module Client
      # Operation
      class Operation < Carserv::PublicApi::Client::Base
        belongs_to :repair_order, shallow_path: true
      end
    end
  end
end
