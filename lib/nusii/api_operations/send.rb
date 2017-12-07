module Nusii
  module ApiOperations
    class Send < Base

      attr_reader :resource_class, :resource, :params

      def initialize resource_class, resource, params
        @resource_class = resource_class
        @resource       = resource
        @params         = params
      end

    private

      def response
        @response ||= connection.post resource_path, params.to_json
      end

      def build_ok_response
        parsed_body
      end

      def resource_path
        "/api/v2/#{resource_url_string}/#{resource.id}/send_proposal"
      end

    end
  end
end