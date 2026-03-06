require 'spec_helper'

RSpec.describe "Template.get" do

  it 'builds a Template object with the retrieved info' do
    template = Nusii::Template.get(42)

    expect(template.id).to eq 42
    expect(template.name).to eq "Web Design Proposal"
    expect(template.account_id).to eq 3
    expect(template.public_template).to eq false
    expect(template.dummy_template).to eq false
  end

end
