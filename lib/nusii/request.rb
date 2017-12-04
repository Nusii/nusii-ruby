module Nusii
  class Request

    def show_call resource_class, resource_id = nil, options = {}
      operator = ApiOperations::Show.new(resource_class, options, resource_id)
      operator.call
    end

    def index_call resource_class, options
      operator = ApiOperations::Index.new(resource_class, options)
      operator.call
    end

    def create_call

    end

    def update_call

    end

    def delete_call

    end


  end
end