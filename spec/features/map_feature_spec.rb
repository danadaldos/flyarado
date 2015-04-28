require 'rails_helper'

feature 'Google Maps' do
  scenario 'user can see map with a location maker of the station' do

    Station.create! name: 'Nofish River', latitude: '39', longitude: '-104', code: '1234'

    visit '/'
    save_and_open_page
    click_link('Show')

    within('#map') do
      expect(page).to have_content("Nofish River")
    end
  end
end
