require 'rails_helper'

RSpec.describe Category, type: :feature do
  before(:each) do
    @user = User.create(
      name: 'Chrispaix',
      email: 'ck@test.com',
      password: '123456789',
      password_confirmation: '123456789'
    )

    @category1 = Category.create(
      name: 'Loisir',
      icon: 'loisir-img.com',
      user_id: @user.id
    )

    @category2 = Category.create(
      name: 'Clothes',
      icon: 'clothes-img.com',
      user_id: @user.id
    )

    visit new_user_session_path
    fill_in 'Email', with: 'ck@test.com'
    fill_in 'Password', with: '123456789'
    click_button 'Log In'
    visit '/'
  end

  it 'Check the presence of Add category button' do
    expect(page).to have_button('Add Category')
  end

  it 'Check if the categories are present' do
    expect(page).to have_content('Loisir')
    expect(page).to have_content('Clothes')
  end

  it 'Check if Add category button link to the right page' do
    click_link('Add Category')
    expect(current_path).to eq('/categories/new')
  end

  it 'Checks if the user_id for categories is correct' do
    expect(@category1.user_id).to eql(@user.id)
    expect(@category2.user_id).to eql(@user.id)
  end
end
