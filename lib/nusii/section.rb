module Nusii
  class Section < Resource

    attr_accessor :id, :currency, :account_id, :proposal_id,
                  :template_id, :title, :name, :body, :position,
                  :reusable, :section_type, :created_at, :updated_at,
                  :page_break, :optional, :selected, :include_total,
                  :total_in_cents, :total_formatted, :line_items

    def self.get id, options={}
      requester = Nusii::Request.new
      requester.show_call self, id, options
    end

    def self.list options={}
      requester = Nusii::Request.new
      requester.index_call self, options
    end

  end
end