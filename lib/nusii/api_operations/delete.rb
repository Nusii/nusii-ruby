module Nusii
  module ApiOperations
    class Delete < Base

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