require 'rails_helper'

feature 'user authentication' do
  scenario 'user can sign up' do

    user = FactoryGirl.build(:user)

    visit '/'
    expect(page).to have_link('Sign up')
    click_link('Sign up')
    expect(page).to have_content('First name')
    fill_in 'First name', with: user.first_name
    fill_in 'Last name', with: user.last_name
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    fill_in 'Password confirmation', with: user.password
    click_button('Create User')
    expect(page).to have_content("Thanks for signing up, #{ user.first_name }")
    expect(page).to have_content("#{ user.email }")
  end
end
