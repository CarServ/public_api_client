# Gem specifications

Gem::Specification.new do |s|
  s.name        = 'public_api_client'
  s.version     = '0.0.0'
  s.summary     = 'A client gem to consume the CarServ Public APIs'
  s.description = 'A client gem to consume the CarServ Public APIs"'
  s.authors     = ['']
  s.email       = ''
  s.files       = ['lib/public_api_client.rb', 'lib/carserv/public_api/client/config.rb', 'lib/carserv/public_api/client/base.rb', 'lib/carserv/public_api/client/repair_order.rb', 'lib/carserv/public_api/client/rate_limiter.rb']
  s.homepage    = 'https://github.com/CarServ/public_api_client'
  s.license     = ''
  s.add_dependency 'faraday', '~> 2.4'
  s.add_dependency 'redis'
end
