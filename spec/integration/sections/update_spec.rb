require 'spec_helper'

RSpec.describe "Section.save" do

  it 'updates a Section' do
    section = Nusii::Section.new(:id => 126, :currency => 'EUR')

    section.currency = "GBP"
    section = section.save

    expect(section.currency).to eq "GBP"
  end

end
