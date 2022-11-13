require 'rails_helper'

RSpec.describe Category, type: :model do
  before(:each) do
    @user = User.create(
      name: 'Chrispaix',
      email: 'ck@test.com',
      password: '123456789',
      password_confirmation: '123456789'
    )
    @category = Category.create(
      name: 'Loisir',
      icon: 'yola.com',
      user_id: @user.id
    )
  end

  it 'Check name of the user' do
    expect(@user.name).to eql('Chrispaix')
  end

  it 'Check the email of the user' do
    expect(@user.email).to eql('ck@test.com')
  end

  it 'Validate presence of user name' do
    @user.name = nil
    expect(@user).to_not be_valid
  end

  it 'Validate presence of user email' do
    @user.email = nil
    expect(@user).to_not be_valid
  end

  it 'Validate presence of category name' do
    @category.name = nil
    expect(@category).to_not be_valid
  end

  it 'Validate presence of category Image' do
    @category.icon = nil
    expect(@category).to_not be_valid
  end
end
