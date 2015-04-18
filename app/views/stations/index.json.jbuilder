json.array!(@stations) do |station|
  json.extract! station, :id, :name, :latitude, :longitude
  json.url station_url(station, format: :json)
end
