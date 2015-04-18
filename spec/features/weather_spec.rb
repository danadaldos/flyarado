require 'rails_helper'

feature 'Weather on the homepage' do
  scenario 'can see weather current weather on show page' do
    visit '/'

    click_link 'New River'

    fill_in 'Station', with: 'Nofish River'
    fill_in 'Cfs', with: '50000'
    fill_in 'Latitude', with: '39.7392'
    fill_in 'Longitude', with: '-104.9903'

    click_button 'Create River'

    expect(page).to have_content("Nofish River")
    expect(page).to have_content("50000")
    expect(page).to have_content(:temperature)
    expect(page).to have_content(:summary)

  end
end
