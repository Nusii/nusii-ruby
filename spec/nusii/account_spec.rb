require 'spec_helper'

RSpec.describe Nusii::Account do

  describe '.me' do
    let(:resource_object) { double 'resource_object' }
    let(:requester) { double 'requester' }

    it 'relies on the right class' do
      expect(Nusii::Request).to receive(:new).
        and_return requester

      expect(requester).to receive(:show_call).
        with(described_class).and_return resource_object

      expect(described_class.me).to eq resource_object
    end
  end


end
