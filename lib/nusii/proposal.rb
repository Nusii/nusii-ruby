module Nusii
  class Proposal < Resource
    extend Nusii::Crud::Get
    extend Nusii::Crud::List

    attr_accessor :id, :account_id, :status, :public_id,
                  :prepared_by_id, :client_id, :sender_id,
                  :sections

  end
end