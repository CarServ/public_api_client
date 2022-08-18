# frozen_string_literal: true

Bundler.require(:default, :test)

require 'minitest/autorun'

unless defined?(Minitest::Test)
  Minitest::Test = Minitest::Unit::TestCase
end

class TestResource < Carserv::PublicApi::Client::Base
  self.site = 'http://example.com/'
end

class Base < TestResource
end

class RepairOrder < TestResource
end

class Customer < TestResource
end
