module Nusii
  class Section < Resource
    extend Nusii::Crud::Get
    extend Nusii::Crud::List

    attr_accessor :id, :currency, :account_id, :proposal_id,
                  :template_id, :title, :name, :body, :position,
                  :reusable, :section_type, :created_at, :updated_at,
                  :page_break, :optional, :selected, :include_total,
                  :total_in_cents, :total_formatted, :line_items

  end
end