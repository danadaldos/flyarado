require 'rails_helper'

feature 'Google Maps' do
  before do
    Station.create! name: 'Orinoco River', latitude: '7.565515', longitude: '-64.9853958', code: '1234'
  end
  scenario 'user can see map with a location maker of the station', js: true do

    visit '/'
    save_and_open_page
    click_link('Show')

    within('#map') do
      expect(page).to have_content("Orinoco River")
    end

    # within('#map') do
    #   expect(page).to have_link("http://maps.google.com/maps?ll=39.0667,-108.5667&amp;z=10&amp;t=m&amp;hl=en-US&amp;gl=US&amp;mapclient=apiv3")
    # expect(page.find("div > div:nth-child(1) > div:nth-child(3) > div:nth-child(4) > div > div.gm-style-iw > div > div").text).to eq(station.name)
    # end
  end
end
