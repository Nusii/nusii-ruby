require 'spec_helper'

RSpec.describe Nusii::Crud::Save do

  class Klass < Nusii::Resource
    include Nusii::Crud::Save
    attr_accessor :id, :name
  end

  let(:klass) { Klass }
  let(:id) { 12 }
  let(:name) { 'Hola' }

  let(:params) { {:name => name} }

  subject { klass.new(params) }

  describe '#save' do
    let(:requester) { double 'requester' }
    let(:resource_object) { double 'resource_object' }

    context 'create' do
      it 'relies on the right class' do
        expect(Nusii::Request).to receive(:new).
          and_return requester

        expect(requester).to receive(:create_call).
          with(klass, subject).and_return resource_object

        expect(subject.save).to eq resource_object
      end
    end

    context 'update' do
      let(:params) { {:id => id, :name => name} }

      it 'relies on the right class' do
        expect(Nusii::Request).to receive(:new).
          and_return requester

        expect(requester).to receive(:update_call).
          with(klass, subject).and_return resource_object

        expect(subject.save).to eq resource_object
      end
    end
  end

end
