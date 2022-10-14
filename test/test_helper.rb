# frozen_string_literal: true

Bundler.require(:default, :test)

require "minitest/autorun"

Minitest::Test = Minitest::Unit::TestCase unless defined?(Minitest::Test)

class TestResource < Carserv::PublicApi::Client::Base
  self.site = ENV.fetch("PUBLIC_API_BASE_URL", nil)
end

class Base < TestResource
end

class RepairOrder < TestResource
end

class Customer < TestResource
end
