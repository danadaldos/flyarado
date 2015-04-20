require 'rails_helper'


feature 'Weather' do
  scenario 'user can see weather current weather on show page' do
    visit '/'

    click_link 'New Station'

    fill_in 'Name', with: 'Nofish River'
    fill_in 'Latitude', with: '39'
    fill_in 'Longitude', with: '-104'

    click_button 'Create Station'

    expect(page).to have_content("Nofish River")
    within("#w_temperature") do
      expect(page).to have_content("97.17")
    end
    within("#w_summary") do
      expect(page).to have_content("Clear")
    end

  end
end

