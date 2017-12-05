module Nusii
  module ApiOperations
    class Delete < Base

      attr_reader :resource_class, :resource_id, :options

      def initialize resource_class, resource_id, options={}
        @resource_class = resource_class
        @resource_id    = resource_id
        @options        = options
      end

    private

      def response
        @response ||= connection.delete resource_path, options
      end

      def build_ok_response
        true
      end

      def resource_path
        "/api/v2/#{resource_url_string}/#{resource_id}"
      end


    end
  end
end