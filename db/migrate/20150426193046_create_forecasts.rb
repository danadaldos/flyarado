class CreateForecasts < ActiveRecord::Migration
  def change
    create_table :forecasts do |t|
      t.references :station
      t.date :date
      t.decimal :mintemp
      t.decimal :maxtemp
      t.text :summary
      t.timestamps null: false
    end
  end
end
