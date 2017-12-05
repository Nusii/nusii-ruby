module Nusii
  class Resource

    def initialize args
      assign_attributes args
    end

    def self.class_name
      name.split("::").last
    end

    def create_params
      editable_attributes.each_with_object({}) do |attribute, result|
        result[attribute.to_s] = self.send(attribute)
      end
    end

    def update_params
      {
        self.class.class_name.underscore.singularize => create_params
      }
    end

  private

    def assign_attributes args
      args.each do |attribute, value|
        value = value.to_i if attribute.match(/\w+\_id$|^id$/)
        instance_variable_set("@#{attribute}", value) unless value.nil?
      end
      self
    end

    def editable_attributes
      raise NotImplementedError,
        "Each subclass must implement this method"
    end

  end
end