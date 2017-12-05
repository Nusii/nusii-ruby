require 'spec_helper'

RSpec.describe Nusii::ApiOperations::Create do

  let(:resource_class) { Nusii::Client }
  let(:resource) { double 'resource' }

  subject { described_class.new resource_class, resource }

  describe '#resource_path' do
    it 'returns the right path' do
      expect(subject.send(:resource_path)).to eq "/api/v2/clients"
    end
  end

end
