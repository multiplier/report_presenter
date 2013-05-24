class AddUserInfoToUsers < ActiveRecord::Migration
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :phone, :string
    add_column :users, :web, :string
    add_column :users, :twitter_url, :string
    add_column :users, :provider, :string
    add_column :users, :uid, :string
  end
end