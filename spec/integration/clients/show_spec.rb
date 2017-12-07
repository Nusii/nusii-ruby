require 'spec_helper'

RSpec.describe "Client.get" do

  it 'builds an Client object with the retrieved info' do
    client = Nusii::Client.get(4)

    expect(client.id).to eq 4
    expect(client.email).to eq "support@nusii.com"
    expect(client.locale).to eq "nl"
  end

end
