require 'spec_helper'

RSpec.describe Nusii::ApiOperations::NestedIndex do

  let(:resource_class) { Nusii::LineItem }
  let(:nested_resource_class) { Nusii::Section }
  let(:nested_resource_id) { 12 }
  let(:options)     { {} }

  subject { described_class.new resource_class, nested_resource_id, nested_resource_class, options }

  describe '#resource_path' do
    it 'returns the right path' do
      expect(subject.send(:resource_path)).to eq "/api/v2/sections/12/line_items"
    end
  end

end
