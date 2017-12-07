require 'spec_helper'

RSpec.describe "LineItem.list_by_section" do

  it 'list LineItems from the same section' do
    response_object = Nusii::LineItem.list_by_section(458)

    line_items = response_object.resources
    expect(line_items.size).to eq 1

    line_item = line_items.first
    expect(line_item.id).to eq 154
    expect(line_item.name).to eq "Redesign website"
  end

end
