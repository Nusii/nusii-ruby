require 'spec_helper'

RSpec.describe Nusii::ApiOperations::Show do

  let(:resource_class) { Nusii::Account }
  let(:resource_id) { nil }

  subject { described_class.new resource_class, resource_id }

  describe '#resource_path' do
    context 'class has its own' do
      it 'returns the right path' do
        expect(subject.send(:resource_path)).to eq resource_class.resource_path
      end
    end

    context 'standard path' do
      let(:resource_class) { Nusii::Client }
      let(:resource_id) { '47' }

      it 'returns the right path' do
        expect(subject.send(:resource_path)).to eq "/api/v2/clients/#{resource_id}"
      end
    end
  end

  describe 'build_ok_response' do
    let(:id) { 3 }
    let(:email) { "hello@your_company.com" }

    let(:parsed_body) do
      {
        "data" => {
          "id" => id,
          "type" => "accounts",
          "attributes" => {
            "email" => email,
          }
        }
      }
    end

    before do
      allow(subject).to receive(:parsed_body).and_return parsed_body
    end

    it 'build a resource object with the retrieved data' do
      resource = subject.send(:build_ok_response)

      expect(resource.id).to eq id
      expect(resource.email).to eq email
      expect(resource.locale).to be_nil
    end
  end
end
