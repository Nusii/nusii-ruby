module Nusii
  class ProposalActivity < Resource
    extend Nusii::Crud::Get
    extend Nusii::Crud::List

    attr_accessor :id, :activity_type, :ip_address, :additional_fields,
                  :proposal_title, :proposal_created_at,
                  :proposal_sent_at, :proposal_status,
                  :proposal_public_id, :proposal_expires_at,
                  :client_name, :client_email, :client_surname,
                  :client_full_name, :client_business, :client_telephone,
                  :client_locale, :client_address, :client_postcode,
                  :client_country, :client_city, :client_state,
                  :client_web

  end
end