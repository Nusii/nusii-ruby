module Nusii
  module ApiOperations
    class Show < Base

    private

      def response
        @response ||= connection.get resource_path
      end

      def build_ok_response
        resource_class.new resource_attributes
      end

      def resource_path
        (resource_class.respond_to?(:resource_path) && resource_class.resource_path) ||
        "/api/v2/#{resource_url_string}/#{resource_id}"
      end

      def resource_attributes
        body = parsed_body['data']['attributes']
        body.tap do |attributes|
          attributes['id'] = parsed_body['data']['id']
        end
      end

    end
  end
end