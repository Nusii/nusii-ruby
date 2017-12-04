require 'spec_helper'

RSpec.describe Nusii::ApiOperations::Index do

  let(:resource_class) { Nusii::Client }
  let(:options)     { {} }

  subject { described_class.new resource_class, options }

  describe '#resource_path' do
    it 'returns the right path' do
      expect(subject.send(:resource_path)).to eq "/api/v2/clients"
    end
  end

  describe '.build_ok_response' do
    let(:data)     { double 'data' }
    let(:meta)     { double 'meta' }
    let(:included) { double 'included' }

    let(:parsed_body) do
      {'data' => data, 'meta' => meta, 'included' => included}
    end

    before do
      allow(subject).to receive(:parsed_body).
        and_return parsed_body
    end

    let(:resources) { double 'resources' }
    let(:builder) { double 'builder' }

    let(:response_object) { double 'response_object' }

    it 'uses JsonApiBuilder' do
      expect(Nusii::Utils::JsonApiBuilder).to receive(:new).
        with(data, included).and_return builder

      expect(builder).to receive(:call).and_return resources

      expect(Nusii::ResponseObject).to receive(:new)
        .with(resources, meta, resource_class)
        .and_return response_object

      expect(subject.send(:build_ok_response)).to eq response_object
    end
  end

end
