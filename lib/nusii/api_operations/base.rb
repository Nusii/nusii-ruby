module Nusii
  module ApiOperations
    class Base

      attr_reader :resource_class, :options, :resource_id

      def initialize resource_class, options={}, resource_id=nil
        @resource_class = resource_class
        @options        = options
        @resource_id    = resource_id
      end

      def call
        if response.status == 200
          build_ok_response
        else
          raise_error_response
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

      def raise_error_response
        current_error = NusiiError.error_for(status)

        raise current_error.new(status, body, reason_phrase)
      end

      def parsed_body
        @parsed_body ||= JSON.parse body
      end

      def resource_url_string
        resource_class.class_name.downcase.pluralize
      end

      def connection
        @connection ||= Connection.new
      end

      delegate :status, :body, :reason_phrase,
               :to => :response

    end
  end
end