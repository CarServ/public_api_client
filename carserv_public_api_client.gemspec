# frozen_string_literal: true

# Gem specifications

$LOAD_PATH.unshift File.expand_path("lib", __dir__)

require "carserv/public_api/client/version"

Gem::Specification.new do |s|
  s.name        = "carserv_public_api_client"
  s.version     = Carserv::PublicApi::Client::VERSION
  s.summary     = "A client gem to consume the CarServ Public APIs"
  s.description = 'A client gem to consume the CarServ Public APIs"'
  s.authors     = ["Carserv Engineering"]
  s.email       = "support@carserv.com"
  s.files       = Dir["{app,config,db,lib}/**/*"]
  s.homepage    = "https://github.com/CarServ/public_api_client"
  s.license     = "MIT"
  s.add_dependency "faraday", ">= 0.15.2", "< 2.0"
  s.add_dependency "json_api_client", "1.21.0"
  s.add_dependency "redis", "~> 4.2.5"
  s.add_development_dependency "dotenv", "~> 2.8", ">= 2.8.1"
  s.add_development_dependency "minitest", "~> 5.16", ">= 5.16.3"
  s.add_development_dependency "minitest-ci", "~> 3.4"
  s.add_development_dependency "minitest-profile", "~> 0.0.2"
  s.add_development_dependency "minitest-spec-context", "~> 0.0.4"
  s.add_development_dependency "rubocop", "~> 1.36"
  s.add_development_dependency "rubocop-minitest", "~> 0.22.2"
  s.add_development_dependency "rubocop-performance", "~> 1.15"
  s.required_ruby_version = "> 3.1"
  s.metadata["rubygems_mfa_required"] = "true"
end
