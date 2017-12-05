module Nusii
  module Crud
    module Save

      def save
        self.id.present? ? update_call : create_call
      end

    private

      def create_call
        requester = Nusii::Request.new
        requester.create_call self.class, self
      end

      def update_call
        requester = Nusii::Request.new
        requester.update_call self.class, self
      end

    end
  end
end