require 'rails_helper'

feature 'user authentication' do
  scenario 'user can sign up' do
    visit '/about'
    expect(page.first('div#test_me').text).to contain('test')
  end
end
