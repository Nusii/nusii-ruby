require 'spec_helper'

RSpec.describe Nusii::ApiOperations::NestedCreate do

  let(:resource_class) { Nusii::LineItem }
  let(:nested_resource_id) { 100 }
  let(:nested_resource) { Nusii::Section }
  let(:params) { {} }
  let(:resource) { double 'resource' }

  subject { described_class.new resource_class, nested_resource_id, nested_resource, params }

  describe '#resource_path' do
    it 'returns the right path' do
      expect(subject.send(:resource_path)).to eq "/api/v2/sections/100/line_items"
    end
  end

end
