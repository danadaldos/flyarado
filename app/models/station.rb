class Station < ActiveRecord::Base
  has_many :weathers
  has_many :flow_readings

  # validates :code, uniqueness: true, presence: true, numericality: { only_integer: true}
  validates :name, presence: true
  validates :longitude, numericality: true
  validates :latitude, numericality: true
# validates :stream_flow, presence: true

  # def weathers
  #   Weather.where(station_id: self.id)
  # end

  def weather
    ForecastIO.api_key = '61abb8248f83b9d71325355d0b4fde8c'
    @cast ||= ForecastIO.forecast(latitude, longitude)
    {
      temperature: @cast.currently.temperature.to_s,
      summary: @cast.currently.summary
    }
  end

  def flow_rate
   first_reading = flow_readings.first
    if first_reading
      first_reading.flow_rate
    end
  end
  # def current_weather
  #  @current_weather ||= weathers.order(created_at: :desc).first
  # end
  #
  # def current_temp
  #   @current_weather.
  # end
  #
  # def current_summary
  #
  # end

end
