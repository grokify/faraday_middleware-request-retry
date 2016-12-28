require "faraday/middleware"

module FaradayMiddleware
  module Request
    # Faraday middleware to handle HTTP Status 429 (rate limiting) / 503 (maintenance)
    class Retry < Faraday::Middleware
      attr_reader :retry_util

      def initialize(app, opts = {})
        super app
        @retry_util = FaradayMiddleware::Request::RetryUtil.new opts
      end

      def call(env)
        original_env = env.dup
        response = @app.call env

        retry_status = @retry_util.retry_status response.env[:status], response.env[:response_headers][:retry_after]

        if retry_status
          @app.call original_env
        else
          response
        end
      end
    end
  end
end

module FaradayMiddleware
  module Request
    # Standalone HTTP request retry utility class
    # Can be used outside of FaradayMiddleware, e.g.
    # when Faraday::UploadIO is used
    class RetryUtil
      DEFAULT_ERROR_CODES = [429, 503].freeze
      DEFAULT_RETRY_AFTER = 10

      attr_accessor :error_codes
      attr_accessor :retry_after

      def initialize(opts = {})
        @error_codes = opts[:error_codes] || DEFAULT_ERROR_CODES
        @retry_after = opts[:retry_after] || DEFAULT_RETRY_AFTER
        @logger = opts[:logger]
      end

      def retry_status(status, this_retry_after = nil)
        return false unless @error_codes.include? status
        seconds_left = (this_retry_after || @retry_after).to_i
        @logger.warn "You have been rate limited. Retrying in #{seconds_left} seconds..." if @logger
        seconds_left.times do |i|
          sleep 1
          time_left = seconds_left - i
          @logger.warn "#{time_left}..." if time_left > 0 && time_left % 5 == 0 && @logger
        end
        @logger.warn 'Retrying...' if @logger
        true
      end
    end
  end
end
