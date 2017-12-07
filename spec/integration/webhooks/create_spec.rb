require 'spec_helper'

RSpec.describe "WebhookEndpoint.create" do

  let(:params) do
    {
      "events" => [
        "proposal_created",
        "client_created"
      ],
      "target_url" => "http://example.com"
    }
  end

  context 'creates from Class' do
    it 'creates a WebhookEndpoint' do
      webhook = Nusii::WebhookEndpoint.create(params)

      expect(webhook.id).not_to be_nil
      expect(webhook.target_url).to eq "http://example.com"
    end
  end

  context 'creates from Instance' do
    it 'creates a WebhookEndpoint' do
      webhook = Nusii::WebhookEndpoint.new(params)
      webhook = webhook.save

      expect(webhook.id).not_to be_nil
      expect(webhook.target_url).to eq "http://example.com"
    end
  end
end
