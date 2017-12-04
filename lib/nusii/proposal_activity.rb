module Nusii
  class ProposalActivity < Resource

    attr_accessor :id, :activity_type, :ip_address, :additional_fields,
                  :proposal_title, :proposal_created_at,
                  :proposal_sent_at, :proposal_status,
                  :proposal_public_id, :proposal_expires_at,
                  :client_name, :client_email, :client_surname,
                  :client_full_name, :client_business, :client_telephone,
                  :client_locale, :client_address, :client_postcode,
                  :client_country, :client_city, :client_state,
                  :client_web

    def self.get id
      requester = Nusii::Request.new
      requester.show_call self, id
    end

    def self.list options={}
      requester = Nusii::Request.new
      requester.index_call self, options
    end

  end
end