module Nusii
  module Crud
    module Destroy

      def destroy id, options={}
        requester = Nusii::Request.new
        requester.delete_call self, id, options
      end

    end
  end
end