class AddVerifiedEmailAndTokenToUsers < ActiveRecord::Migration
  def change
    add_column :users, :verified_email, :boolean
    add_column :users, :token, :string
  end
end
