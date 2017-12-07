require 'spec_helper'

RSpec.describe "Proposal.destroy" do

  it 'deletes the Proposal' do
    deletion = Nusii::Proposal.destroy(126)

    expect(deletion).to be true
  end

end
