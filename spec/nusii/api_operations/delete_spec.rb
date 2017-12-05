require 'spec_helper'

RSpec.describe Nusii::ApiOperations::Delete do

  let(:resource_class) { Nusii::Client }
  let(:resource_id) { 13 }
  let(:options)     { {} }

  subject { described_class.new resource_class, resource_id, options }

  describe '#resource_path' do
    it 'returns the right path' do
      expect(subject.send(:resource_path)).to eq "/api/v2/clients/#{resource_id}"
    end
  end

end
