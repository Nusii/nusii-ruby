require 'spec_helper'

RSpec.describe Nusii::Section do

  describe '.get' do
    let(:resource_object) { double 'resource_object' }
    let(:resource_id) { 12 }
    let(:options) { {:include_sections => true} }
    let(:requester) { double 'requester' }

    it 'relies on the right class' do
      expect(Nusii::Request).to receive(:new).
        and_return requester

      expect(requester).to receive(:show_call).
        with(described_class, resource_id, options).and_return resource_object

      expect(described_class.get(resource_id, options)).to eq resource_object
    end
  end


end
