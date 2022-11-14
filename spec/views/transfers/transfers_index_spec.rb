

require 'rails_helper'

RSpec.describe 'categories index page', type: :feature do
  before(:each) do
    @user = User.create(
        name: 'Chrispaix',
        email: 'ck@test.com',
        password: '123456789',
        password_confirmation: '123456789',
      )
  
      @category = Category.create(
          name: 'Loisir',
          icon: 'loisir-img.com',
          user_id: @user.id
        )

    visit new_user_session_path
    fill_in 'Email', with: 'ck@test.com'
    fill_in 'Password', with: '123456789'
    click_button 'Log in'
    visit '/'

    @transfer1 = Transfer.create(
      name: 'Velo', amount: 54.3, user_id: @user.id,
    )
    @transfer2 = Transfer.create(name: 'Casque velo', amount: 12.5, user_id: @user.id)
    JoinCategoriesWithTransfer.create(category_id: @category.id, transfer_id: @transfer1.id)
    JoinCategoriesWithTransfer.create(category_id: @category.id, transfer_id: @transfer2.id)

    visit "/categories/#{@category.id}/transfers"
  end

  it 'Should have Title = Transaction ' do
    expect(page).to have_content('Transactions')
  end

  it 'Should display category title ' do
    expect(page).to have_content(@category.name)
  end

  it 'Should have the total of category transfers amount ' do
    expect(page).to have_content (@category.transfers.sum(:amount).to_s)
  end

  it 'Should have transfers title/names ' do
    expect(page).to have_content('Casque')
    expect(page).to have_content('Velo')
  end

  it 'Should have transfers amount ' do
    expect(page).to have_content(@transfer1.amount)
    expect(page).to have_content(@transfer2.amount)
  end

  it 'Check if it have an Add transfer button' do
    expect(page).to have_button('Add Transaction')
  end

  it 'Add button link to the correct page' do
    click_link('Add Transaction')
    expect(current_path).to eq("/categories/#{@category.id}/transfers/new")
  end

end
