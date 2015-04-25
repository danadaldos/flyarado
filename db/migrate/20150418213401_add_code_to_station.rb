class AddCodeToStation < ActiveRecord::Migration
  def change
    add_column :stations, :code, :integer, limit: 8
  end
end
