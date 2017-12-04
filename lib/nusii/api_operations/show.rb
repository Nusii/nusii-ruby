module Nusii
  module ApiOperations
    class Show < Base

    private

      def response
        @response ||= connection.get resource_path, options
      end

      def build_ok_response
        builder = Utils::JsonApiBuilder.new(parsed_body['data'], parsed_body['included'])
        builder.call
      end

      def resource_path
        (resource_class.respond_to?(:resource_path) && resource_class.resource_path) ||
        "/api/v2/#{resource_url_string}/#{resource_id}"
      end


    end
  end
end