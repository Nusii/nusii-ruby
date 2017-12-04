require "spec_helper"

RSpec.describe Nusii do
  describe 'version number' do
    it "has a version number" do
      expect(Nusii::VERSION).not_to be nil
    end
  end

  describe 'api_key' do
    let(:api_key) { 'thisismyapikey' }

    it "has an api_key" do
      expect(Nusii.api_key).to be_nil
      Nusii.api_key = api_key
      expect(Nusii.api_key).to eq api_key
    end
  end

  describe 'client_name' do
    let(:client_name) { 'Big Company' }

    it "has an client_name" do
      expect(Nusii.client_name).to be_nil
      Nusii.client_name = client_name
      expect(Nusii.client_name).to eq client_name
    end
  end
end
