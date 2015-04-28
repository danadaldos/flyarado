class CreateFavoriteStation < ActiveRecord::Migration
  def change
    create_table :favorite_stations do |t|
      t.timestamps null: false

    end

    add_reference :favorite_stations, :user, index: true
    add_reference :favorite_stations, :station, index: true
    add_foreign_key :favorite_stations, :users


  end
end
