require 'spec_helper'

RSpec.describe "Section.get" do

  it 'builds an Section object with the retrieved info' do
    section = Nusii::Section.get(164)

    expect(section.id).to eq 164
    expect(section.currency).to eq "GBP"
    expect(section.account_id).to eq 3
  end

end
