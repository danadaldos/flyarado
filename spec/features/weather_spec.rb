require 'rails_helper'

feature 'Weather on the homepage' do
  scenario 'can see weather current weather on show page' do
    visit '/'

    click_link 'New Station'

    fill_in 'Name', with: 'Nofish River'
    fill_in 'Latitude', with: '39.7392'
    fill_in 'Longitude', with: '-104.9903'

    click_button 'Create Station'

    expect(page).to have_content("Nofish River")
    expect("#w_temperature").to_not be_empty
    expect('#w_summary').to_not eq("Overcast")

  end
end
