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

  describe '.build_ok_response' do
    let(:data)     { double 'data' }
    let(:included) { double 'included' }

    let(:parsed_body) do
      {'data' => data, 'included' => included}
    end

    before do
      allow(subject).to receive(:parsed_body).
        and_return parsed_body
    end

    let(:resource) { double 'resource' }
    let(:builder) { double 'builder' }

    let(:response_object) { double 'response_object' }

    it 'uses JsonApiBuilder' do
      expect(Nusii::Utils::JsonApiBuilder).to receive(:new).
        with(data, included).and_return builder

      expect(builder).to receive(:call).and_return resource

      expect(subject.send(:build_ok_response)).to eq resource
    end
  end

end
