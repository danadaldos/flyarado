require 'rails_helper'

RSpec.describe Forecast, type: :model do
  it 'should fill the database with Services::Forecaster.run' do
    expect(Forecast.count).to eq(0)
    Services::Forecaster.run
    expect(Forecast.count).to be > 0
  end
end
