# frozen_string_literal: true

Bundler.require(:default, :test)

require 'minitest/autorun'
require_relative '../../resources.rb'
require_relative '../../errors/rate_limit_error'
require_relative '../../config'
require_relative '../../authenticator'
require_relative '../../version'

Minitest::Test = Minitest::Unit::TestCase unless defined?(Minitest::Test)

class TestResource < Carserv::PublicApi::Client::Base
  self.site = 'http://example.com/'
end

class Base < TestResource
end

class RepairOrder < TestResource
end

class Customer < TestResource
end
