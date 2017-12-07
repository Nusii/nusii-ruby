require 'spec_helper'

RSpec.describe "Section.index" do

  it 'retrieves Sections' do
    response_object = Nusii::Section.list

    clients = response_object.resources
    expect(clients.size).to eq 1

    client = clients.first
    expect(client.id).to eq 164
    expect(client.total_in_cents).to eq 50000
  end

end
