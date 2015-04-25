class CreateFavoriteStation < ActiveRecord::Migration
  def change
    create_table :favorite_stations do |t|
      t.timestamp null: false

    end

    add_reference :favorite_stations, :user, index: true
    add_foreign_key :favorite_stations, :users

    add_reference :stations, :user, index: true
    add_foreign_key :stations, :users

  end
end
