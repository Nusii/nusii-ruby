require 'spec_helper'

RSpec.describe "WebhookEndpoint.get" do

  it 'builds an WebhookEndpoint object with the retrieved info' do
    webhook = Nusii::WebhookEndpoint.get(33)

    expect(webhook.id).to eq 33
    expect(webhook.target_url).to eq "http://example.com/webhooks"
  end

end
