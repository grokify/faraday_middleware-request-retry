Gem::Specification.new do |s|
  s.name        = 'faraday_middleware-request-retry'
  s.version     = '0.0.2'
  s.date        = '2016-11-09'
  s.summary     = 'Faraday request middleware with retry'
  s.description = 'This Faraday middleware gem adds request retries for 429 and 503 errors'
  s.authors     = ['John Wang']
  s.email       = 'johncwang@gmail.com'
  s.homepage    = 'https://github.com/grokify/'
  s.license     = 'Apache License Version 2.0'
  s.files       = [
    'CHANGELOG.md',
    'LICENSE.md',
    'README.md',
    'Rakefile',
    'lib/faraday_middleware-request-retry.rb',
    'lib/faraday_middleware-request-retry/retry.rb',
    'test/test_setup.rb'
  ]
  s.required_ruby_version = '>= 2.0.0'

  s.add_dependency 'faraday', '~> 0.9', '>= 0.9'
  s.add_dependency 'faraday_middleware', '~> 0', '>= 0'

  s.add_development_dependency 'coveralls', '~> 0'
  s.add_development_dependency 'rake', '~> 11'
  s.add_development_dependency 'simplecov', '~> 0'
  s.add_development_dependency 'test-unit', '~> 3'
end
