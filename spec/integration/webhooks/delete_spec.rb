require 'spec_helper'

RSpec.describe "WebhookEndpoint.destroy" do

  it 'deletes the WebhookEndpoint' do
    deletion = Nusii::WebhookEndpoint.destroy(164)

    expect(deletion).to be true
  end

end
