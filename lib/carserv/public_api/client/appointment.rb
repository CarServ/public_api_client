# frozen_string_literal: true

module Carserv
  module PublicApi
    module Client
      # Appointment
      class Appointment < Carserv::PublicApi::Client::Base
        belongs_to :customer, shallow_path: true
      end
    end
  end
end
