module Nusii
  module Crud
    module Create

      def create params, options={}
        new_resource = self.new(params)
        new_resource.save
      end

    end
  end
end