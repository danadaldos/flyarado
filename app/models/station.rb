class Station < ActiveRecord::Base
  def weather
    @weather ||= begin
      ForecastIO.api_key = '61abb8248f83b9d71325355d0b4fde8c'
      @cast = ForecastIO.forecast(latitude, longitude)
      {
        temperature: @cast.currently.temperature,
        summary: @cast.currently.summary
      }
    end
  end
end
