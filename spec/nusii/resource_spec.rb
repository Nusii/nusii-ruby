require 'spec_helper'

RSpec.describe Nusii::Resource do

  class Nusii::Friend < Nusii::Resource
    attr_accessor :id, :name, :country, :locale, :city

    def editable_attributes; [:name, :country, :city ]; end
  end

  let(:klass) { Nusii::Friend }
  let(:id) { 12 }
  let(:name) { 'Miguel Cobre' }
  let(:country) { 'Spain' }
  let(:locale) { 'es' }
  let(:city) { 'Ciudad Real' }

  let(:params) do
    {
      :id => id,
      :name => name,
      :country => country,
      :locale => locale,
      :city => city,
    }
  end

  subject { klass.new(params) }

  describe '#editable_params' do
    let(:expected_output) do
      {
        'name' => name,
        'country' => country,
        'city' => city
      }
    end

    it 'returns the expected output' do
      expect(subject.editable_params).to eq expected_output
    end
  end

  describe '#save_params' do
    let(:expected_output) do
      {
        'friend' => {
          'name' => name,
          'country' => country,
          'city' => city
        }
      }
    end

    it 'returns the expected output' do
      expect(subject.save_params).to eq expected_output
    end
  end

end
