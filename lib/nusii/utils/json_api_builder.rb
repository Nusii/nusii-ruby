module Nusii
  module Utils
    class JsonApiBuilder
      attr_reader :data, :extra, :is_collection

      def initialize data, extra
        @is_collection = data.is_a?(Array)
        @data          = data.is_a?(Array) ? data : [data]
        @extra         = extra
      end

      def call
        is_collection ? parsed_data : parsed_data.first
      end

    private

      def parsed_data
        data.each_with_object([]) do |resource_info, result|
          result << resource_class.new(attributes_for(resource_info))
        end
      end

      def attributes_for resource_info
        {}.tap do |result|
          result.merge! flat_id_with_attributes_for resource_info
          result.merge! relationship_attributes_for(resource_info)
        end
      end

      def relationship_attributes_for resource_info
        (resource_info['relationships']||{}).each_with_object({}) do |(resource_type, resource_data), result|
          resource_data['data'].each do |related_resource|
            klass = "Nusii::#{resource_type.classify}".constantize
            resource_id = related_resource['id']

            result[resource_type] ||= []
            result[resource_type] << klass.new(extract_from_included(resource_type, resource_id))
          end
        end
      end

      def extract_from_included resource_type, resource_id
        ( parsed_included.present? &&
          parsed_included[resource_type][resource_id] ) ||
        {'id' => resource_id }
      end

      def parsed_included
        @parsed_included ||= (extra||{}).each_with_object({}) do |item, result|
          result[item['type']] ||= {}
          result[item['type']][item['id']] = flat_id_with_attributes_for(item)
        end
      end

      def flat_id_with_attributes_for item
        new_item = item['attributes']
        new_item.tap do |new_item_temp|
          new_item_temp['id'] = item['id']
        end
      end

      def resource_class
        "Nusii::#{data.first['type'].classify}".constantize
      end

    end
  end
end