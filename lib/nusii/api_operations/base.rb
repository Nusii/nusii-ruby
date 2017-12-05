module Nusii
  module ApiOperations
    class Base

      def call
        if [200, 201].include?(response.status)
          update_rate_limit && build_ok_response
        else
          update_rate_limit && raise_error_response
        end
      end

    private

      def response
        raise NotImplementedError,
          "Each subclass must implement this method"
      end

      def build_ok_response
        raise NotImplementedError,
          "Each subclass must implement this method"
      end

      def resource_path
        raise NotImplementedError,
          "Each subclass must implement this method"
      end

      def update_rate_limit
        Nusii.rate_limit_remaining   = headers["x-ratelimit-remaining"].to_i
        Nusii.rate_limit_retry_after = headers["x-ratelimit-retry-after"].to_i
      end

      def raise_error_response
        current_error = NusiiError.error_for(status)

        raise current_error.new(status, body, reason_phrase)
      end

      def parsed_body
        @parsed_body ||= JSON.parse body
      end

      def resource_url_string
        resource_class.class_name.underscore.pluralize
      end

      def connection
        @connection ||= Connection.new
      end

      delegate :status, :body, :reason_phrase, :headers,
               :to => :response

    end
  end
end