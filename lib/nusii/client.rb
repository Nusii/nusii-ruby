module Nusii
  class Client < Resource
    extend Nusii::Crud::Get
    extend Nusii::Crud::List
    extend Nusii::Crud::Create
    include Nusii::Crud::Save
    extend Nusii::Crud::Destroy
    include Nusii::Crud::DestroySelf

    attr_accessor :id, :email, :name, :surname, :full_name,
                  :currency, :business, :locale, :pdf_page_size,
                  :web, :telephone, :address, :city, :postcode,
                  :country, :city, :state

  private

    def editable_attributes
      [ :email, :name, :surname, :currency, :business,
        :locale, :pdf_page_size, :web, :telephone, :address,
        :city, :postcode, :country, :state ]
    end

  end
end