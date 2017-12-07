require 'spec_helper'

RSpec.describe "Proposal.index" do

  it 'retrieves Proposals' do
    response_object = Nusii::Proposal.list

    proposals = response_object.resources
    expect(proposals.size).to eq 1

    proposal = proposals.first
    expect(proposal.id).to eq 126
    expect(proposal.title).to eq "Webdesign yourwebsite.com"
  end

end
