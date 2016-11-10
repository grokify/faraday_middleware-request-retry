Gem::Specification.new do |s|
  s.name        = 'faraday_middleware-request-retry'
  s.version     = '0.0.1'
  s.date        = '2016-11-09'
  s.summary     = 'Faraday request middleware with retry'
  s.description = 'This Faraday middleware gem adds request retries for 429 and 503 errors'
  s.authors     = ['John Wang']
  s.email       = 'johncwang@gmail.com'
  s.homepage    = 'https://github.com/grokify/'
  s.licenses    = ['MIT']
  s.files       = [
    'CHANGELOG.md',
    'LICENSE.md',
    'README.md',
    'Rakefile',
    'lib/faraday_middleware-request-retry.rb',
    'lib/faraday_middleware-request-retry/retry.rb',
    'test/test_setup.rb'
  ]
  s.add_dependency 'faraday', '~> 0.9', '>= 0.9'
  s.add_dependency 'faraday_middleware', '~> 0', '>= 0'

  s.add_development_dependency 'coveralls'
  s.add_development_dependency 'rake'
  s.add_development_dependency 'simplecov'
  s.add_development_dependency 'test-unit'
end
