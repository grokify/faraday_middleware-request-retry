require "faraday/middleware"

module FaradayMiddleware
  module Request
    # Faraday middleware to handle HTTP Status 429 (rate limiting) / 503 (maintenance)
    class Retry < Faraday::Middleware
      DEFAULT_RETRY_AFTER = 10
      ERROR_CODES = [429, 503]

      def initialize(app, options = {})
        super(app)
        @logger = options[:logger]
        @retry_after = options[:retry_after] || DEFAULT_RETRY_AFTER
        @error_codes = options[:error_codes] || ERROR_CODES
      end

      def call(env)
        original_env = env.dup
        response = @app.call(env)

        if @error_codes.include? response.env[:status]
          seconds_left = (response.env[:response_headers][:retry_after] || @retry_after).to_i
          @logger.warn "You have been rate limited. Retrying in #{seconds_left} seconds..." if @logger

          seconds_left.times do |i|
            sleep 1
            time_left = seconds_left - i
            @logger.warn "#{time_left}..." if time_left > 0 && time_left % 5 == 0 && @logger
          end

          @logger.warn '' if @logger

          @app.call original_env
        else
          response
        end
      end
    end
  end
end
