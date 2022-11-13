require 'rails_helper'

RSpec.describe Transfer, type: :model do
  before(:each) do
    @user = User.create(
      name: 'Chrispaix',
      email: 'ck@test.com',
      password: '123456789',
      password_confirmation: '123456789'
    )
    @transfer = Transfer.create(
      name: 'Loisir',
      amount: 3785.42,
      user_id: @user.id
    )
  end

  it 'Validate presence of transfer name' do
    @transfer.name = nil
    expect(@transfer).to_not be_valid
  end

  it 'Validate presence of transfer Amount' do
    @transfer.amount = nil
    expect(@transfer).to_not be_valid
  end

  it 'Check transfer Label / name' do
    expect(@transfer.name).to eql('Loisir')
  end

  it 'Check transfer Amount' do
    expect(@transfer.amount).to eql(3785.42)
  end

end
