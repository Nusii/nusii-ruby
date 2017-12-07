module Nusii
  module ApiOperations
    class NestedCreate < Create

      attr_reader :resource_class, :nested_resource_id,
                  :nested_resource_class, :params

      def initialize resource_class, nested_resource_id, nested_resource_class, params
        @resource_class        = resource_class
        @nested_resource_id    = nested_resource_id
        @nested_resource_class = nested_resource_class
        @params                = params
      end

    private

      def response
        @response ||= connection.post resource_path, params.to_json
      end

      def resource_path
        "/api/v2/#{nested_resource_url_string}/#{nested_resource_id}/#{resource_url_string}"
      end

      def nested_resource_url_string
        nested_resource_class.class_name.downcase.pluralize
      end

    end
  end
end