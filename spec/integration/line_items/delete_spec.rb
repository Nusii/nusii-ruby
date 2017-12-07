require 'spec_helper'

RSpec.describe "LineItem.destroy" do

  it 'deletes the LineItem' do
    deletion = Nusii::LineItem.destroy(157)

    expect(deletion).to be true
  end

end
