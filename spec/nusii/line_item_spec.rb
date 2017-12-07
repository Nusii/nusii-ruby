require 'spec_helper'

RSpec.describe Nusii::LineItem do

  describe '.list_by_section' do
    let(:response_object) { double 'response_object' }
    let(:options) { {} }
    let(:section_id) { 54 }
    let(:requester) { double 'requester' }

    it 'relies on the right class' do
      expect(Nusii::Request).to receive(:new).
        and_return requester

      expect(requester).to receive(:nested_index_call).
        with(described_class, section_id, Nusii::Section, options).
        and_return response_object

      expect(described_class.list_by_section(section_id)).to eq response_object
    end
  end

  describe '.create_with_section' do
    let(:response_object) { double 'response_object' }
    let(:params) { {} }
    let(:section_id) { 54 }
    let(:requester) { double 'requester' }

    it 'relies on the right class' do
      expect(Nusii::Request).to receive(:new).
        and_return requester

      expect(requester).to receive(:nested_create_call).
        with(described_class, section_id, Nusii::Section, params).
        and_return response_object

      expect(described_class.create_with_section(section_id, params)).to eq response_object
    end
  end

end
