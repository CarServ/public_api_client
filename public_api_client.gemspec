# frozen_string_literal: true

# Gem specifications

$LOAD_PATH.unshift File.expand_path('lib', __dir__)

require 'carserv/public_api/client/version'

Gem::Specification.new do |s|
  s.name        = 'public_api_client'
  s.version     = Carserv::PublicApi::Client::VERSION
  s.summary     = 'A client gem to consume the CarServ Public APIs'
  s.description = 'A client gem to consume the CarServ Public APIs"'
  s.authors     = ['Carserv-dev']
  s.email       = ''
  s.files       = Dir['{app,config,db,lib}/**/*']
  s.homepage    = 'https://github.com/CarServ/public_api_client'
  s.license     = 'MIT'
  s.add_dependency 'faraday', '>= 0.15.2', '< 2.0'
  s.add_dependency 'json_api_client', '1.21.0'
  s.add_dependency 'redis', '~> 4.2.5'
  s.required_ruby_version = '> 3.0.0'
  s.metadata['rubygems_mfa_required'] = 'true'
end
