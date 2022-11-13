require 'rails_helper'

RSpec.describe User, type: :model do
  before(:each) do
    @user = User.create(
      name: 'Chrispaix',
      email: 'ck@test.com',
      password: '123456789',
      password_confirmation: '123456789'
    )
  end

  it 'Validate presence of user Name' do
    @user.name = nil
    expect(@user).to_not be_valid
  end

  it 'Check value of user Name' do
    expect(@user.name).to eql('Chrispaix')
  end

  it 'Validate the presence of the user email' do
    @user.name = nil
    expect(@user).to_not be_valid
  end

  it 'Check value of user email' do
    expect(@user.email).to eql('ck@test.com')
  end

  it 'Validate the presence of the user password' do
    @user.password = nil
    expect(@user).to_not be_valid
  end
  
  it 'The user email should be unique' do
    @user2 = User.create(
      name: 'Chrispaix',
      email: 'ck@test.com',
      password: '123456789',
      password_confirmation: '123456789'
    )
    expect(@user2).to_not be_valid
  end

end
