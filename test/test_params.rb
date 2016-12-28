require 'coveralls'
Coveralls.wear!

require 'faraday'
require 'faraday_middleware'
require 'faraday_middleware-request-retry'
require 'test/unit'

class RetryParamsTest < Test::Unit::TestCase
  def setup
    @retry_after_default = 10
    @retry_after_custom = 15
    @error_codes_default = [429, 503]
    @error_codes_custom = [429, 503, 504]
  end

  def test_error_codes_default
    @conn = Faraday.new 'http://example.com/api' do |builder|
      builder.use FaradayMiddleware::Request::Retry
    end
    assert_equal @error_codes_default, @conn.builder.app.error_codes
  end

  def test_error_codes_custom
    @conn = Faraday.new 'http://example.com/api' do |builder|
      builder.use FaradayMiddleware::Request::Retry, error_codes: @error_codes_custom
    end
    assert_equal @error_codes_custom, @conn.builder.app.error_codes
  end

  def test_retry_after_default
    @conn = Faraday.new 'http://example.com/api' do |builder|
      builder.use FaradayMiddleware::Request::Retry
    end
    assert_equal @retry_after_default, @conn.builder.app.retry_after
  end

  def test_retry_after_custom
    @conn = Faraday.new 'http://example.com/api' do |builder|
      builder.use FaradayMiddleware::Request::Retry, retry_after: @retry_after_custom
    end
    assert_equal @retry_after_custom, @conn.builder.app.retry_after
  end
end
