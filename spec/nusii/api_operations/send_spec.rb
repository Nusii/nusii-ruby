require 'spec_helper'

RSpec.describe Nusii::ApiOperations::Send do

  let(:resource_class) { Nusii::Proposal }
  let(:resource_id) { 94 }
  let(:resource) { double 'resource', :id => resource_id }
  let(:params) { {} }

  subject { described_class.new resource_class, resource, params }

  describe '#resource_path' do
    it 'returns the right path' do
      expect(subject.send(:resource_path)).to eq "/api/v2/proposals/#{resource_id}/send_proposal"
    end
  end

end
