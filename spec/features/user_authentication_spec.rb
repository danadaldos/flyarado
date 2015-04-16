require 'rails_helper'

feature 'user authentication' do
  scenario 'user can log in' do
    user = FactoryGirl.create(:user)

    visit '/'
    expect(page).to have_link('Log in')
    click_link('Log in')
    expect(page).to have_content('Log in')
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Log in'
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
