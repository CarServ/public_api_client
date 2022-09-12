# frozen_string_literal: true

module Carserv
  module PublicApi
    module Client
      # Vehicle
      class Vehicle < Carserv::PublicApi::Client::Base
        belongs_to :repair_order, shallow_path: true
      end
    end
  end
end
