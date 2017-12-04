require "spec_helper"

RSpec.describe Nusii do
  describe 'version number' do
    it "has a version number" do
      expect(Nusii::VERSION).not_to be nil
    end
  end

  let(:user_agent) { 'Big Company' }
  let(:api_key) { 'thisismyapikey' }

  describe '.setup' do
    it 'add the params' do
      expect(Nusii.api_key).to be_nil
      expect(Nusii.user_agent).to be_nil

      Nusii.setup :api_key => api_key, :user_agent => user_agent

      expect(Nusii.api_key).to eq api_key
      expect(Nusii.user_agent).to eq user_agent
    end
  end

end
