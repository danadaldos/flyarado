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
      temperature: @cast.currently.temperature,
      summary: @cast.currently.summary,
      
      day_two_time: @cast.daily.data.second.time,
      day_two_high: @cast.daily.data.second.temperatureMax,
      day_two_low: @cast.daily.data.second.temperatureMin,
      day_two_summary: @cast.daily.data.second.summary,
      
      day_three_time: @cast.daily.data.third.time,
      day_three_high: @cast.daily.data.third.temperatureMax,
      day_three_low: @cast.daily.data.third.temperatureMin,
      day_three_summary: @cast.daily.data.third.summary,
      
      day_four_time: @cast.daily.data.fourth.time,
      day_four_high: @cast.daily.data.fourth.temperatureMax,
      day_four_low: @cast.daily.data.fourth.temperatureMin,
      day_four_summary: @cast.daily.data.fourth.summary,
      
      day_five_time: @cast.daily.data.fifth.time,
      day_five_high: @cast.daily.data.fifth.temperatureMax,
      day_five_low: @cast.daily.data.fifth.temperatureMin,
      day_five_summary: @cast.daily.data.fifth.summary,
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
