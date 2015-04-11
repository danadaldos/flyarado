json.array!(@rivers) do |river|
  json.extract! river, :id, :station, :cfs
  json.url river_url(river, format: :json)
end
