# frozen_string_literal: true

Bundler.require(:default, :test)

require "minitest/autorun"
require "minitest-spec-context"
require "dotenv"
Dotenv.overload(".env.test")

Minitest::Test = Minitest::Unit::TestCase unless defined?(Minitest::Test)

class Base < Carserv::PublicApi::Client::Base
end

class RepairOrder < Carserv::PublicApi::Client::Base
end

class Customer < Carserv::PublicApi::Client::Base
end
