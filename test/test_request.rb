require 'coveralls'
Coveralls.wear!

require 'faraday'
require 'faraday_middleware'
require 'faraday_middleware-request-retry'
require 'test/unit'

class RetryParamsTest < Test::Unit::TestCase
  def test_request
    stubs = Faraday::Adapter::Test::Stubs.new do |stub|
      stub.get('/200') { |env| [200, {}, 'success'] }
      stub.get('/429') { |env| [429, {}, 'too many requests'] }
    end

    @conn = Faraday.new 'http://example.com/api' do |builder|
      builder.use FaradayMiddleware::Request::Retry
      builder.adapter :test, stubs do |stub|
        stub.get('/200') { |env| [200, {}, 'success'] }
        stub.get('/429') { |env| [429, {}, 'too many requests'] }
      end
    end

    @conn.get do |req|
      req.url '/200'
      req.options.timeout = 1
      req.options.open_timeout = 1
    end

    @conn.get do |req|
      req.url '/429'
      req.options.timeout = 1
      req.options.open_timeout = 1
    end
  end
end
