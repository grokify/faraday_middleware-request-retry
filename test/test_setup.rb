require 'coveralls'
Coveralls.wear!

require 'test/unit'
require 'faraday'
require 'faraday_middleware'
require 'faraday_middleware-request-retry'

class RetryTest < Test::Unit::TestCase
  def testSetup

    @conn = Faraday.new 'http://example.com/api' do |builder|
      builder.use FaradayMiddleware::Request::Retry
    end

  end
end