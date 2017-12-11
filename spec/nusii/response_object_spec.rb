require 'spec_helper'

RSpec.describe Nusii::ResponseObject do

  let(:resource_class) { Nusii::Client }
  let(:resources) { [] }
  let(:current_page) { 2 }
  let(:next_page) { 4 }
  let(:prev_page) { 2 }
  let(:total_count) { 29 }
  let(:total_pages) { 8 }
  let(:meta) do
    {
      'current_page' => current_page,
      'next_page' => next_page,
      'prev_page' => prev_page,
      'total_count' => total_count,
      'total_pages' => total_pages
    }
  end

  subject { described_class.new resources, meta, resource_class }

  describe '#next_page' do
    it 'makes a request for the next page' do
      expect(resource_class).to receive(:list).
        with(:page => next_page, :per => 4)

      subject.next_page
    end
  end

  describe '#prev_page' do
    it 'makes a request for the previous page' do
      expect(resource_class).to receive(:list).
        with(:page => prev_page, :per => 4)

      subject.prev_page
    end
  end

end
