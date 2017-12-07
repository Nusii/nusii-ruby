require 'spec_helper'

RSpec.describe "Section.destroy" do

  it 'deletes the Section' do
    deletion = Nusii::Section.destroy(164)

    expect(deletion).to be true
  end

end
