module Nusii
  class Request

    def show_call resource_class, resource_id = nil, options = {}
      operator = ApiOperations::Show.new(resource_class, resource_id, options)
      operator.call
    end

    def index_call resource_class, options={}
      operator = ApiOperations::Index.new(resource_class, options)
      operator.call
    end

    def nested_index_call resource_class, nested_resource_id, nested_resource, options={}
      operator = ApiOperations::NestedIndex.new(resource_class, nested_resource_id, nested_resource, options)
      operator.call
    end

    def create_call resource_class, resource
      operator = ApiOperations::Create.new(resource_class, resource)
      operator.call
    end

    def nested_create_call resource_class, nested_resource_id, nested_resource_class, params
      operator = ApiOperations::NestedCreate.new(resource_class, nested_resource_id, nested_resource_class, params)
      operator.call
    end

    def update_call resource_class, resource
      operator = ApiOperations::Update.new(resource_class, resource)
      operator.call
    end

    def delete_call resource_class, resource_id, options={}
      operator = ApiOperations::Delete.new(resource_class, resource_id, options)
      operator.call
    end

    def send_call resource_class, resource, params
      operator = ApiOperations::Send.new(resource_class, resource, params)
      operator.call
    end

  end
end