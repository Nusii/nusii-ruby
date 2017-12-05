require 'spec_helper'

RSpec.describe Nusii::Crud::Destroy do

  let(:klass) { Class.new { extend Nusii::Crud::Destroy } }

  describe '.destroy' do
    let(:resource_id) { 12 }
    let(:options) { {:include_sections => true} }
    let(:requester) { double 'requester' }

    it 'relies on the right class' do
      expect(Nusii::Request).to receive(:new).
        and_return requester

      expect(requester).to receive(:delete_call).
        with(klass, resource_id, options).and_return true

      expect(klass.destroy(resource_id, options)).to eq true
    end
  end


end
