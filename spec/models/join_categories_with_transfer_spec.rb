require 'rails_helper'

RSpec.describe JoinCategoriesWithTransfer, type: :model do
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
    @transfer = Transfer.create(
      name: 'Watch',
      amount: 3785.42,
      user_id: @user.id
    )

    @transfer_sample = JoinCategoriesWithTransfer.create(
      category_id: @category.id,
      transfer_id: @transfer.id
    )
  end

  it 'Check if transfer sample is valid' do
    expect(@transfer_sample).to be_valid
  end

  it 'Validate the presence of transfer id' do
    @transfer_sample.transfer_id = nil
    expect(@transfer_sample).to_not be_valid
  end

  it 'Check the value of transfer id' do
    expect(@transfer_sample.transfer_id).to eql(@transfer.id)
  end

  it 'Transfer id of th transfer sample is an integer' do
    expect(@transfer_sample.transfer_id).to be_kind_of Integer
  end

  it 'Transfer id of th transfer sample must be an integer' do
    @transfer_sample.transfer_id = 'sampletext'
    expect(@transfer_sample).to_not be_valid
  end

  it 'Validate the presence of category id' do
    @transfer_sample.category_id = nil
    expect(@transfer_sample).to_not be_valid
  end

  it 'Check the value of category id' do
    expect(@transfer_sample.category_id).to eql(@category.id)
  end

  it 'Category id of th transfer sample is an integer' do
    expect(@transfer_sample.category_id).to be_kind_of Integer
  end

  it 'Category id of th transfer sample must be an integer 2' do
    @transfer_sample.category_id = 'sampletext'
    expect(@transfer_sample).to_not be_valid
  end
end
