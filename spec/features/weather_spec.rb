require 'rails_helper'


feature 'Weather' do
  scenario 'user can see current weather for the only station on its page' do

    Station.create! name: 'Nofish River', latitude: '39', longitude: '-104', code:'1234'

    visit '/'
    click_link('Show')

    expect(page).to have_content("Nofish River")

    within("#w_temperature") do
      expect(page).to have_content("47.3")
    end
    within("#w_summary") do
      expect(page).to have_content("Clear")
    end

  end
end

