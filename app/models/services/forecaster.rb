require 'open-uri'
module Services
  class Forecaster
    def self.run
      stations.each do |station|
        write_forecast(station)
      end
    end

    private

    def self.forecast_for(station)
      ForecastIO.forecast(station.latitude, station.longitude)
    end

    def self.write_forecast(station)
      station_forecast = forecast_for(station)
      station_forecast.daily.data.each do |datum|
        station.forecasts.create(date: Time.at(datum.time).to_date, mintemp: datum.temperatureMin, maxtemp: datum.temperatureMax, summary: datum.summary)
      end
    end

    def self.stations
      Station.all
    end
  end
end

