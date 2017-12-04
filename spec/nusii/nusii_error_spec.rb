require 'spec_helper'

RSpec.describe Nusii::NusiiError do

  let( :status )        { '401' }
  let( :body )          { '' }
  let( :reason_phrase ) { 'unauthorized' }

  subject { described_class.new status, body, reason_phrase }

  describe '.error_for' do
    let(:unauthorized_code) { 401 }
    let(:unauthorized_class_error) { Nusii::UnauthorizedError }

    it 'returns the right class' do
      expect(described_class.error_for(unauthorized_code)).to eq unauthorized_class_error
    end
  end

  describe '#to_s' do
    context 'no body' do
      let(:expected_message) { "Status: 401\nMessage: unauthorized" }

      it 'returns the right message' do
        expect(subject.to_s).to eq expected_message
      end
    end

    context 'with body' do
      let(:body) { 'Error message' }
      let(:expected_message) { "Status: 401\nMessage: Error message" }

      it 'returns the right message' do
        expect(subject.to_s).to eq expected_message
      end

    end
  end

end
