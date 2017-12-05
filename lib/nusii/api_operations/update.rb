module Nusii
  module ApiOperations
    class Update < Base

      attr_reader :resource_class, :resource

      def initialize resource_class, resource
        @resource_class = resource_class
        @resource       = resource
      end

    private

      def response
        @response ||= connection.put resource_path, resource.update_params.to_json
      end

      def build_ok_response
        builder = Utils::JsonApiBuilder.new(parsed_body['data'], parsed_body['included'])
        builder.call
      end

      def resource_path
        "/api/v2/#{resource_url_string}/#{resource.id}"
      end


    end
  end
end