module Nusii
  module ApiOperations
    class Index < Base

      attr_reader :resource_class, :options

      def initialize resource_class, options={}
        @resource_class = resource_class
        @options        = options
      end

    private

      def response
        @response ||= connection.get resource_path, options
      end

      def build_ok_response
        ResponseObject.new(resources, meta, resource_class)
      end

      def resources
        builder = Utils::JsonApiBuilder.new(parsed_body['data'], parsed_body['included'])
        builder.call
      end

      def meta
        parsed_body['meta']
      end

      def resource_path
        "/api/v2/#{resource_url_string}"
      end

    end
  end
end