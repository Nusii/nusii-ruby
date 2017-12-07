require 'spec_helper'

RSpec.describe "LineItem.index" do

  it 'retrieves LineItems' do
    response_object = Nusii::LineItem.list

    line_items = response_object.resources
    expect(line_items.size).to eq 1

    line_item = line_items.first
    expect(line_item.id).to eq 154
    expect(line_item.name).to eq "Redesign website"
  end

end
