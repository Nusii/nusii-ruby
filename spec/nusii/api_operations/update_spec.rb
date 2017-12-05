require 'spec_helper'

RSpec.describe Nusii::ApiOperations::Update do

  let(:resource_class) { Nusii::Client }
  let(:resource_id) { 12 }
  let(:resource) { double 'resource', :id => resource_id }

  subject { described_class.new resource_class, resource }

  describe '#resource_path' do
    it 'returns the right path' do
      expect(subject.send(:resource_path)).to eq "/api/v2/clients/#{resource_id}"
    end
  end

end
