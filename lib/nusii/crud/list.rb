module Nusii
  module Crud
    module List

      def list options={}
        requester = Nusii::Request.new
        requester.index_call self, options
      end

    end
  end
end