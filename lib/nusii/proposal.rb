module Nusii
  class Proposal < Resource

    attr_accessor :id, :account_id, :status, :public_id,
                  :prepared_by_id, :client_id, :sender_id,
                  :sections

    def self.get id, options={}
      requester = Nusii::Request.new
      requester.show_call self, id, options
    end

    def self.list options={}
      requester = Nusii::Request.new
      requester.index_call self, options
    end

  end
end