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

  scenario 'user can log in' do
    user = FactoryGirl.create(:user)

    visit '/'
    expect(page).to have_link('Log in')
    click_link('Log in')
    expect(page).to have_content('Log in')
    fill_in 'Email', with: user.email
    expect(page).to have_field('Password', type: 'password')
    fill_in 'Password', with: user.password
    click_button 'Log in'
    expect(page).to have_content("Welcome back, #{user.first_name}")
    expect(page).to have_content(user.email)
  end

  scenario 'user cannot login with invalid email' do
    user = FactoryGirl.create(:user)

    visit '/'
    expect(page).to have_link('Log in')
    click_link('Log in')
    expect(page).to have_content('Log in')
    fill_in 'Email', with: 'notmyemail@address.com'
    fill_in 'Password', with: user.password
    click_button 'Log in'
    expect(page).to have_content('Invalid email or password')
  end

  scenario 'user cannot login with invalid password' do
    user = FactoryGirl.create(:user)

    visit '/'
    expect(page).to have_link('Log in')
    click_link('Log in')
    expect(page).to have_content('Log in')
    fill_in 'Email', with: user.email
    fill_in 'Password', with: 'ThisIsNotMyPassword1234'
    click_button 'Log in'
    expect(page).to have_content('Invalid email or password')
  end
end
