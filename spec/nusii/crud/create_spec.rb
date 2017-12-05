require 'spec_helper'

RSpec.describe Nusii::Crud::Create do

  class Klass < Nusii::Resource
    extend Nusii::Crud::Create
  end

  let(:klass) { Klass }

  describe '.list' do
    let(:new_resource) { double 'new_resource' }
    let(:params) { {} }
    let(:response) { double 'response' }

    it 'relies on the right class' do
      expect(klass).to receive(:new).
        with(params).and_return new_resource

      expect(new_resource).to receive(:save).
        and_return response

      expect(klass.create(params)).to eq response
    end
  end

end
