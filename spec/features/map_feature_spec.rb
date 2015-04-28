require 'rails_helper'

feature 'Google Maps' do
  before do
    FactoryGirl.create(:station)
  end
  scenario 'user can see map with a location maker of the station', js: true do
    visit '/'

    expect(page).to have_content('Name')

    click_link('New Station')

    fill_in 'Name', with: @station.name
    fill_in 'Latitude', with: @station.latitude
    fill_in 'Longitude', with: @station.longitude
    fill_in 'Code', with: @station.code

    click_button('Create Station')

    find('#show', :visible => false).click

    within('#map') do
      expect(page).to have_content("Orinoco River")
    end
  end
end
