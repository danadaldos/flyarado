class Station < ActiveRecord::Base
  has_many :weathers

  # def weathers
  #   Weather.where(station_id: self.id)
  # end

  def weather
    ForecastIO.api_key = '61abb8248f83b9d71325355d0b4fde8c'
    @cast ||= ForecastIO.forecast(latitude, longitude)
    {
      temperature: @cast.currently.temperature,
      summary: @cast.currently.summary
    }
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
