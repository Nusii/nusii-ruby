require 'spec_helper'

RSpec.describe "Proposal.send_proposal" do

  it 'sends a Proposal' do
    proposal = Nusii::Proposal.new(:id => 126, :title => 'Webdesign')

    status = proposal.send_proposal(:email => 'test@test.com')

    expect(status['status']).to eq 'pending'
  end

end
