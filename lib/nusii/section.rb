module Nusii
  class Section < Resource
    extend Nusii::Crud::Get
    extend Nusii::Crud::List
    extend Nusii::Crud::Destroy
    include Nusii::Crud::DestroySelf

    attr_accessor :id, :currency, :account_id, :proposal_id,
                  :template_id, :title, :name, :body, :position,
                  :reusable, :section_type, :created_at, :updated_at,
                  :page_break, :optional, :selected, :include_total,
                  :total_in_cents, :total_formatted, :line_items

  private

    def editable_attributes
      [ :proposal_id, :template_id, :title, :body,
        :name, :position, :reusable, :section_type,
        :page_break, :optional, :include_total ]
    end

  end
end