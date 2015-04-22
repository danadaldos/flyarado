require 'rails_helper'

feature 'Google Maps' do
  scenario 'user can see map with a location maker of the station' do

    Station.create! name: 'Nofish River', latitude: '39', longitude: '-104', code:'1234'

    visit '/'
    click_link('Show')

      expect(page.find('#main-map-canvas'))
    within('#main-map-canvas') do
      expect(page).to
    end

