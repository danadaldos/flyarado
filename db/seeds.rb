
  station = Station.create(name: 'Boulder', latitude: 1, longitude: 2, code:1)
            FavoriteStation.create(user_id: 3, station_id: 3)



user = User.create!(first_name: 'John', last_name: 'Smith', email: 'smith@john.com', password: 'hi',
  password_confirmation: 'hi')


# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
