require 'spec_helper'

RSpec.describe "Proposal.create" do

  let(:params) do
    {
      "title" => "Webdesign yourwebsite.com",
      "account_id" => 3,
      "status" => "draft",
      "public_id" => "-NqDAkiqpiFLuuw",
      "prepared_by_id" => 3,
      "client_id" => 5,
      "sender_id" => nil
    }
  end

  context 'creates from Class' do
    it 'creates a Proposal' do
      proposal = Nusii::Proposal.create(params)

      expect(proposal.id).not_to be_nil
      expect(proposal.account_id).to eq 3
      expect(proposal.client_id).to eq 5
    end
  end

  context 'creates from Instance' do
    it 'creates a Proposal' do
      proposal = Nusii::Proposal.new(params)
      proposal = proposal.save

      expect(proposal.id).not_to be_nil
      expect(proposal.account_id).to eq 3
      expect(proposal.client_id).to eq 5
    end
  end
end
