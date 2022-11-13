require 'rails_helper'

RSpec.describe Category, type: :feature do
  before(:each) do

    @user = User.create(
      name: 'Chrispaix',
      email: 'ck@test.com',
      password: '123456789',
      password_confirmation: '123456789',
    )

    Category.create(
        name: 'Loisir',
        icon: 'loisir-img.com',
        user_id: @user.id
      )
    
    Category.create(
      name: 'Clothes',
      icon: 'clothes-img.com',
      user_id: @user.id
    )

    visit new_user_session_path
    fill_in 'Email', with: 'ck@test.com'
    fill_in 'Password', with: '123456789'
    click_button 'Log in'
    visit '/'

  end

  it 'Check if the categories are present' do
    expect(page).to have_content('Loisir')
    expect(page).to have_content('Clothes')
  end
end