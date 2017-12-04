module Nusii
  class Account < Resource

    attr_reader :id, :email, :name, :subdomain, :web, :currency,
                :pdf_page_size, :locale, :address, :address_state,
                :postcode, :city, :telephone, :default_theme

    def self.me
      requester = Nusii::Request.new
      requester.show_call(Account)
    end

    def self.resource_path
      "/api/v2/account/me"
    end

  end
end