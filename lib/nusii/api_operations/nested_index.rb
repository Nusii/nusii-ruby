module Nusii
  module ApiOperations
    class NestedIndex < Index

      attr_reader :resource_class, :nested_resource_id,
                  :nested_resource_class, :options

      def initialize resource_class, nested_resource_id, nested_resource_class, options={}
        @resource_class        = resource_class
        @nested_resource_id    = nested_resource_id
        @nested_resource_class = nested_resource_class
        @options               = options
      end

    private

      def resource_path
        "/api/v2/#{nested_resource_url_string}/#{nested_resource_id}/#{resource_url_string}"
      end

      def nested_resource_url_string
        nested_resource_class.class_name.downcase.pluralize
      end

    end
  end
end