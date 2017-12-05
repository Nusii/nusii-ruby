module Nusii
  class Client < Resource
    extend Nusii::Crud::Get
    extend Nusii::Crud::List

    attr_accessor :id, :email, :name, :surname, :full_name,
                  :currency, :business, :locale, :pdf_page_size,
                  :web, :telephone, :address, :city, :postcode,
                  :country, :city

  end
end