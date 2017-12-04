module Nusii
  class Proposal < Resource

    attr_accessor :id, :account_id, :status, :public_id,
                  :prepared_by_id, :client_id, :sender_id, :sections_ids

    def self.get id
      requester = Nusii::Request.new
      requester.show_call self, id
    end

  end
end