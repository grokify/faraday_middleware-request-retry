require 'coveralls'
Coveralls.wear!

require 'faraday'
require 'faraday_middleware'
require 'faraday_middleware-request-retry'
require 'test/unit'

class RetryTest < Test::Unit::TestCase
  def test_setup
    @conn = Faraday.new 'http://example.com/api' do |builder|
      builder.use FaradayMiddleware::Request::Retry
    end
    assert_equal 'FaradayMiddleware::Request::Retry', @conn.builder.app.class.name
  end
end
