
require 'rails_helper'

feature 'Google Maps' do
  before do
    FactoryGirl.create(:station)
  end
  scenario 'user can see map with a location maker of the station'  do  #, js: true
    visit '/'

    expect(page).to have_content('Name')

  end
end
