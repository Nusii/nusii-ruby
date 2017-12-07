require 'spec_helper'

RSpec.describe "Client.destroy" do

  it 'deletes the Client' do
    deletion = Nusii::Client.destroy(12)

    expect(deletion).to be true
  end

end
