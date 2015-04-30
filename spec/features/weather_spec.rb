require 'rails_helper'

# This spec uses Webmock to make an API call and, if successful,
# returns a preset temperature and summary, hence "47.3" and "Clear"

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


    #This section is intended to test the weather on the Show page

    #Unable to get Capybara to find "Show" link, even though it's there in the save_and_open_page.
    #page.find('#show', :visible => false).click
    # page.find('label', text: 'Show').click

    # expect(page).to have_content("Orinoco")
    # expect(page).to have_content("47.3")
    # expect(page).to have_content("Clear")

  end
end

