# Gem specifications

Gem::Specification.new do |s|
  s.name        = 'public_api_client'
  s.version     = '0.0.0'
  s.summary     = 'A client gem to consume the CarServ Public APIs'
  s.description = 'A client gem to consume the CarServ Public APIs"'
  s.authors     = ['']
  s.email       = ''
  s.files       = ['lib/public_api_client.rb', 'lib/carserv/public_api/client/config.rb',
                   'lib/carserv/public_api/client/base.rb', 'lib/carserv/public_api/client/repair_order.rb',
                   'lib/carserv/public_api/client/authenticator.rb',
                   'lib/carserv/public_api/client/errors/rate_limit_error.rb']
  s.homepage    = 'https://github.com/CarServ/public_api_client'
  s.license     = ''
  s.add_dependency 'faraday', '>= 0.15.2', '< 2.0'
  s.add_dependency 'json_api_client', '1.21.0'
  s.add_dependency 'redis'
end
