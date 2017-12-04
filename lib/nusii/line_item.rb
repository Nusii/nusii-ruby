module Nusii
  class LineItem < Resource

    attr_accessor :id, :section_id, :name, :position, :cost_type,
                  :recurring_type, :per_type, :quantity, :currency,
                  :amount_in_cents, :amount_formatted, :total_in_cents,
                  :total_formatted, :updated_at, :created_at

  end
end