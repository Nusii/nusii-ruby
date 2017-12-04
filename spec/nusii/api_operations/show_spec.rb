require 'spec_helper'

RSpec.describe Nusii::ApiOperations::Show do

  let(:resource_class) { Nusii::Account }
  let(:options)     { {} }
  let(:resource_id) { nil }

  subject { described_class.new resource_class, options, resource_id }

  describe '#resource_path' do
    context 'class has its own' do
      it 'returns the right path' do
        expect(subject.send(:resource_path)).to eq resource_class.resource_path
      end
    end

    context 'standard path' do
      let(:resource_class) { Nusii::Client }
      let(:resource_id) { '47' }

      it 'returns the right path' do
        expect(subject.send(:resource_path)).to eq "/api/v2/clients/#{resource_id}"
      end
    end
  end

end
