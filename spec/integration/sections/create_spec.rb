require 'spec_helper'

RSpec.describe "Section.create" do

  let(:params) do
    {
      "currency"        => "GBP",
      "account_id"      => 3,
      "proposal_id"     => 126,
      "template_id"     => nil,
      "title"           => "Introduction",
      "name"            => nil,
      "body"            => nil,
      "position"        => 0,
      "reusable"        => false,
      "section_type"    => "cost",
      "page_break"      => false,
      "optional"        => false,
      "selected"        => false,
      "include_total"   => false,
      "total_in_cents"  => 50000,
      "total_formatted" => "£500.00"
    }
  end

  context 'creates from Class' do
    it 'creates a Section' do
      section = Nusii::Section.create(params)

      expect(section.id).not_to be_nil
      expect(section.currency).to eq "GBP"
      expect(section.position).to eq 0
    end
  end

  context 'creates from Instance' do
    it 'creates a Section' do
      section = Nusii::Section.new(params)
      section = section.save

      expect(section.id).not_to be_nil
      expect(section.currency).to eq "GBP"
      expect(section.position).to eq 0
    end
  end
end
