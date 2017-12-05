require 'spec_helper'

RSpec.describe Nusii::Crud::DestroySelf do

  class Klass < Nusii::Resource
    include Nusii::Crud::DestroySelf
    attr_accessor :id
  end

  let(:klass) { Klass }
  let(:id) { 12 }

  subject { klass.new({:id => id}) }

  describe '.destroy' do
    let(:resource_object) { double 'resource_object' }
    let(:resource_id) { 12 }
    let(:options) { {:include_sections => true} }
    let(:requester) { double 'requester' }

    it 'relies on the right class' do
      expect(Nusii::Request).to receive(:new).
        and_return requester

      expect(requester).to receive(:delete_call).
        with(klass, id, options).and_return resource_object

      expect(subject.destroy(options)).to eq resource_object
    end
  end


end
