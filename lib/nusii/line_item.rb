module Nusii
  class LineItem < Resource
    extend Nusii::Crud::List

    attr_accessor :id, :section_id, :name, :position, :cost_type,
                  :recurring_type, :per_type, :quantity, :currency,
                  :amount_in_cents, :amount_formatted, :total_in_cents,
                  :total_formatted, :updated_at, :created_at

    def self.list_by_section section_id, options={}
      requester = Nusii::Request.new
      requester.nested_index_call self, section_id, Nusii::Section, options
    end

  end
end