# frozen_string_literal: true

Bundler.require(:default, :test)

require "minitest/autorun"
require "minitest-spec-context"
require "dotenv"
Dotenv.overload(".env.test")

Minitest::Test = Minitest::Unit::TestCase unless defined?(Minitest::Test)

class Base < Carserv::PublicApi::Client::Base
end

class Appointment < Carserv::PublicApi::Client::Base
end

class Customer < Carserv::PublicApi::Client::Base
end

class Inspection < Carserv::PublicApi::Client::Base
end

class Operation < Carserv::PublicApi::Client::Base
end

class Technician < Carserv::PublicApi::Client::Base
end

class RepairOrder < Carserv::PublicApi::Client::Base
end

class RepairShop < Carserv::PublicApi::Client::Base
end

class ServiceAdvisor < Carserv::PublicApi::Client::Base
end

class Vehicle < Carserv::PublicApi::Client::Base
end
