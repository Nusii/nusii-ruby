require 'spec_helper'

RSpec.describe "WebhookEndpoint.index" do

  it 'retrieves WebhookEndpoints' do
    response_object = Nusii::WebhookEndpoint.list

    webhooks = response_object.resources
    expect(webhooks.size).to eq 1

    webhook = webhooks.first
    expect(webhook.id).to eq 26
    expect(webhook.target_url).to eq "http://example.com/webhooks"
  end

end
