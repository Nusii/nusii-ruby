require 'spec_helper'

RSpec.describe "Client.create" do

  let(:params) do
    {
      "email"         => "john@doe.com",
      "name"          => "John",
      "surname"       => "Doe",
      "full_name"     => "John Doe",
      "currency"      => "EUR",
      "business"      => "Michael Koper BV",
      "locale"        => "en",
      "pdf_page_size" => "A4",
      "web"           => "www.michaelkoper.com",
      "telephone"     => "1234567890",
      "address"       => "Madrid Street 34",
      "city"          => "Madrid",
      "postcode"      => "28018",
      "country"       => "Spain",
      "state"         => "Madrid"
    }
  end

  context 'creates from Class' do
    it 'creates a Client' do
      client = Nusii::Client.create(params)

      expect(client.id).not_to be_nil
      expect(client.email).to eq "john@doe.com"
      expect(client.name).to eq "John"
    end
  end

  context 'creates from Instance' do
    it 'creates a Client' do
      client = Nusii::Client.new(params)
      client = client.save

      expect(client.id).not_to be_nil
      expect(client.email).to eq "john@doe.com"
      expect(client.name).to eq "John"
    end
  end
end
