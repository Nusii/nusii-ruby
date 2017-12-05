module Nusii
  module Crud
    module Get

      def get id, options={}
        requester = Nusii::Request.new
        requester.show_call self, id, options
      end

    end
  end
end