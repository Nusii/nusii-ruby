module Nusii
  class WebhookEndpoint < Resource
    extend Nusii::Crud::Get
    extend Nusii::Crud::List
    extend Nusii::Crud::Create
    extend Nusii::Crud::Destroy
    include Nusii::Crud::DestroySelf

    attr_accessor :id, :target_url, :events

    def save
      requester = Nusii::Request.new
      requester.create_call self.class, self
    end

  private

    def editable_attributes
      [ :target_url, :events ]
    end

  end
end