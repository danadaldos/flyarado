require 'rails_helper'

feature 'Google Maps' do
  scenario 'user can see map with a location maker of the station' do

    Station.create! name: 'Nofish River', latitude: '39', longitude: '-104', code: '1234'

    visit '/'
    click_link('Show')

    within('#map') do
      expect(page).to have("http://maps.google.com/maps?ll=39.0667,-108.5667&amp;z=10&amp;t=m&amp;hl=en-US&amp;gl=US&amp;mapclient=apiv3")
      # expect(page.find("div > div:nth-child(1) > div:nth-child(3) > div:nth-child(4) > div > div.gm-style-iw > div > div").text).to eq(station.name)
    end
  end
end
