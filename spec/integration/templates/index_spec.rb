require 'spec_helper'

RSpec.describe "Template.index" do

  it 'retrieves Templates' do
    response_object = Nusii::Template.list

    templates = response_object.resources
    expect(templates.size).to eq 1

    template = templates.first
    expect(template.id).to eq 42
    expect(template.name).to eq "Web Design Proposal"
  end

end
