require 'spec_helper'

RSpec.describe "Proposal.save" do

  it 'updates a Proposal' do
    proposal = Nusii::Proposal.new(:id => 126, :title => 'Webdesign')

    proposal.title = "Webdesign yourwebsite.com"
    proposal = proposal.save

    expect(proposal.title).to eq "Webdesign yourwebsite.com"
  end

end
