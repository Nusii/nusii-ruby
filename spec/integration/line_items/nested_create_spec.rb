require 'spec_helper'

RSpec.describe "LineItem.create_with_section" do

  let(:section_id) { 458 }

  let(:params) do
    {
      "name" => "",
      "position" => 2,
      "cost_type" => "fixed",
      "recurring_type" => nil,
      "per_type" => nil,
      "quantity" => nil,
      "updated_at" => "2017-11-27T10:45:09.919Z",
      "created_at" => "2017-11-27T10:45:09.919Z",
      "currency" => "GBP",
      "amount_in_cents" => nil,
      "amount_formatted" => "£0.00",
      "total_in_cents" => 0,
      "total_formatted" => "£0.00"
    }
  end

  it 'creates a LineItem under a section' do
    line_item = Nusii::LineItem.create_with_section(section_id, params)

    expect(line_item.id).not_to be_nil
    expect(line_item.section_id).to eq section_id
  end

end
