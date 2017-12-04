module Nusii
  class Section < Resource

    attr_accessor :id, :currency, :account_id, :proposal_id,
                  :template_id, :title, :name, :body, :position,
                  :reusable, :section_type, :created_at, :updated_at,
                  :page_break, :optional, :selected, :include_total,
                  :total_in_cents, :total_formatted

  end
end