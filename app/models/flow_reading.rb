class FlowReading < ActiveRecord::Base
  belongs_to :station

  def self.get_data
    require 'JSON'
    require 'open-uri'
    request = open('http://waterservices.usgs.gov/nwis/dv/?format=json,1.1&stateCd=co&siteType=ST&siteStatus=active')
    result = JSON.parse(request.read)
    readings = result['value']['timeSeries']

    readings.each do |reading|
      flow_rate = reading['values'].first['value'].first['value'].to_f
      date_time = ['values'].first['value'].first['dateTime']
      station_name = reading['sourceInfo']['siteName']
      latitude = reading['sourceInfo']['geoLocation']['geogLocation']['latitude']
      longitude = reading['sourceInfo']['geoLocation']['geogLocation']['longitude']
      station_code = reading['sourceInfo']['siteCode'].first['value']
      station = Station.find_or_create_by(code: station_code) do |station|
        station.name = station_name
        station.latitude = latitude
        station.longitude = longitude
      end
      self.create(cfs: flow_rate, station: station, date_time: date_time)
    end
  end
end