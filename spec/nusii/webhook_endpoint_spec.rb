require 'spec_helper'

RSpec.describe Nusii::WebhookEndpoint do

  let(:target_url) { 'http://target.com' }
  let(:events) { ['event_1', 'event_2'] }

  let(:params) { {:taget_url => target_url, :events => events} }

  subject { described_class.new params }

  describe '#save' do
    let(:requester) { double 'requester' }
    let(:resource_object) { double 'resource_object' }

    it 'relies on the right class' do
      expect(Nusii::Request).to receive(:new).
        and_return requester

      expect(requester).to receive(:create_call).
        with(described_class, subject).and_return resource_object

      expect(subject.save).to eq resource_object
    end
  end

end
