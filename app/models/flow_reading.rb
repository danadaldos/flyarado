require 'JSON'
require 'open-uri'

class FlowReading < ActiveRecord::Base
  belongs_to :station

  def self.get_data
    request = open('http://waterservices.usgs.gov/nwis/dv/?format=json,1.1&stateCd=co&siteType=ST&siteStatus=active')
    result = JSON.parse(request.read)
    result_sets = result['value']['timeSeries']
    result_sets.map do |result_set|
      flow_reading_result = FlowReadingResult.new(result_set)
      station = Station.where(code: flow_reading_result.station_code).first_or_create do |station|
        station.name = flow_reading_result.station_name
        station.latitude = flow_reading_result.latitude
        station.longitude = flow_reading_result.longitude
      end

      self.create(flow_rate: flow_reading_result.flow_rate, station: station,
        date_time: flow_reading_result.date_time)
    end
  end
end
