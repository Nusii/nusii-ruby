require 'spec_helper'

RSpec.describe "Proposal.get" do

  it 'builds an Proposal object with the retrieved info' do
    proposal = Nusii::Proposal.get(126)

    expect(proposal.id).to eq 126
    expect(proposal.title).to eq "Webdesign yourwebsite.com"
    expect(proposal.client_id).to eq 5
  end

end
