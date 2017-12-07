require 'spec_helper'

RSpec.describe "Client.index" do

  it 'retrieves Clients' do
    response_object = Nusii::Client.list

    clients = response_object.resources
    expect(clients.size).to eq 2

    client = clients.first
    expect(client.id).to eq 12
    expect(client.email).to eq "support@nusii.com"
  end

end
