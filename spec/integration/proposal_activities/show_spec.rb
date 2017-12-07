require 'spec_helper'

RSpec.describe "ProposalActivity.get" do

  it 'builds an ProposalActivity object with the retrieved info' do
    proposal_activity = Nusii::ProposalActivity.get(44)

    expect(proposal_activity.id).to eq 44
    expect(proposal_activity.activity_type).to eq "user_send_proposal"
    expect(proposal_activity.proposal_title).to eq "Design for clientwebsite.com"
  end

end
