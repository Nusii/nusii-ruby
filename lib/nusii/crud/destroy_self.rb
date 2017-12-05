module Nusii
  module Crud
    module DestroySelf

      def destroy options={}
        raise ArgumentError, "This #{self.class.class_name} has no id" if self.id.blank?

        requester = Nusii::Request.new
        requester.delete_call self.class, self.id, options
      end

    end
  end
end