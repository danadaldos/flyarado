class AddCodeToStation < ActiveRecord::Migration
  def change
    add_column :stations, :code, :integer, limit: 10
  end
end
