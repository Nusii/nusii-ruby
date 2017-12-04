module Nusii
  class Client < Resource

    attr_accessor :id, :email, :name, :surname, :full_name,
                  :currency, :business, :locale, :pdf_page_size,
                  :web, :telephone, :address, :city, :postcode,
                  :country, :city

    def self.get id
      requester = Nusii::Request.new
      requester.show_call self, id
    end


  end
end