module Nusii
  class Proposal < Resource
    extend Nusii::Crud::Get
    extend Nusii::Crud::List
    extend Nusii::Crud::Create
    include Nusii::Crud::Save
    extend Nusii::Crud::Destroy
    include Nusii::Crud::DestroySelf

    attr_accessor :id, :account_id, :status, :public_id,
                  :prepared_by_id, :client_id, :client_email,
                  :sender_id, :document_section_title,
                  :prepared_by_id, :expires_at, :sections

    def send params
      requester = Nusii::Request.new
      requester.send_call self.class, self, params
    end

  private

    def editable_attributes
      [ :title, :client_id, :client_email, :document_section_title,
        :prepared_by_id, :expires_at, :expires_at, :display_date,
        :report, :exclude_total, :exclude_total_in_pdf, :theme ]
    end

  end
end