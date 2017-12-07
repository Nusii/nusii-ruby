require 'spec_helper'

RSpec.describe Nusii::Proposal do

  let(:id) { 12 }
  let(:params) { {:id => id} }

  subject { described_class.new(params) }

  describe '#send' do
    let(:requester) { double 'requester' }
    let(:send_params) { double 'send_params' }
    let(:status) { double 'status' }

    it 'relies on the right class' do
      expect(Nusii::Request).to receive(:new).
        and_return requester

      expect(requester).to receive(:send_call).
        with(described_class, subject, send_params).
        and_return status

      expect(subject.send_proposal(send_params)).to eq status
    end
  end

end
