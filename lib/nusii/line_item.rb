module Nusii
  class LineItem < Resource
    extend Nusii::Crud::List
    extend Nusii::Crud::Destroy
    include Nusii::Crud::DestroySelf

    attr_accessor :id, :section_id, :name, :position, :cost_type,
                  :recurring_type, :per_type, :quantity, :currency,
                  :amount_in_cents, :amount_formatted, :total_in_cents,
                  :total_formatted, :updated_at, :created_at, :amount

    def self.list_by_section section_id, options={}
      requester = Nusii::Request.new
      requester.nested_index_call self, section_id, Nusii::Section, options
    end

    def self.create_with_section section_id, params
      requester = Nusii::Request.new
      requester.nested_create_call self, section_id, Nusii::Section, params
    end

    def save
      raise(ArgumentError, 'You can\'t update a line item without id') if self.id.blank?

      requester = Nusii::Request.new
      requester.update_call self.class, self
    end

  private

    def editable_attributes
      [ :name, :cost_type, :recurring_type, :per_type,
        :position, :quantity, :amount ]
    end

  end
end