require 'spec_helper'

RSpec.describe "Account.me" do

  it 'builds an Account object with the retrieved info' do
    account = Nusii::Account.me

    expect(account.id).to eq 3
    expect(account.email).to eq "hello@your_company.com"
  end

end
