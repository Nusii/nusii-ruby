require 'spec_helper'

RSpec.describe Nusii::Crud::List do

  let(:klass) { Class.new { extend Nusii::Crud::List } }

  describe '.list' do
    let(:response_object) { double 'response_object' }
    let(:options) { {} }
    let(:requester) { double 'requester' }

    it 'relies on the right class' do
      expect(Nusii::Request).to receive(:new).
        and_return requester

      expect(requester).to receive(:index_call).
        with(klass, options).and_return response_object

      expect(klass.list(options)).to eq response_object
    end
  end

end
