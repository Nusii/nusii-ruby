require 'spec_helper'

RSpec.describe "ProposalActivity.index" do

  it 'retrieves ProposalActivities' do
    response_object = Nusii::ProposalActivity.list

    proposal_activities = response_object.resources
    expect(proposal_activities.size).to eq 1

    proposal_activity = proposal_activities.first
    expect(proposal_activity.id).to eq 259
    expect(proposal_activity.ip_address).to eq "127.0.0.1"
  end

end
