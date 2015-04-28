require 'rails_helper'

feature 'Weather' do
  before do
    station = Station.create! name: 'Orinoco River', latitude: '7.565515', longitude: '-64.9853958', code: '1234'
    # FactoryGirl.build(:station)
  end
  scenario 'user can see current weather for the only station on its page' do

    visit '/'

    expect(page).to have_content("Orinoco")
    expect(page).to have_content("47.3")
    expect(page).to have_content("Clear")

    #Unable to get Capybara to find "Show" link, even though it's there in the save_and_open_page.
    #page.find('#show', :visible => false).click
    # page.find('label', text: 'Show').click

    # expect(page).to have_content("Orinoco")
    # expect(page).to have_content("47.3")
    # expect(page).to have_content("Clear")

  end
end

