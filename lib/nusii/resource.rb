module Nusii
  class Resource

    def initialize args
      assign_attributes args
    end

    def self.class_name
      name.split("::").last
    end

  private

    def assign_attributes args
      args.each do |attribute, value|
        value = value.to_i if attribute.match(/\w+\_id$|^id$/)
        instance_variable_set("@#{attribute}", value) unless value.nil?
      end
      self
    end



  end
end