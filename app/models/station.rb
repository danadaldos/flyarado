class Station < ActiveRecord::Base
  has_many :forecasts
  has_many :flow_readings
  has_many :favorite_stations


  validates :code, uniqueness: true, presence: true, numericality: { only_integer: true}
  validates :name, presence: true
  validates :longitude, numericality: true
  validates :latitude, numericality: true
  # validates :stream_flow, presence: true

  def current_forecast
    @current_forecast ||= ForecastIO.forecast(latitude, longitude)
  end

  def current_summary
    current_forecast.currently.summary
  end

  def current_temp
    current_forecast.currently.temperature
  end

  def forecast_at(date)
    forecasts.where(date: date).order(created_at: :desc).first
  end

  def flow_rate
    first_reading = flow_readings.first
    if first_reading
      first_reading.flow_rate
    end
  end
end
