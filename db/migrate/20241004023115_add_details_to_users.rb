class AddDetailsToUsers < ActiveRecord::Migration[7.2]
  def change
    add_column :users, :email, :string
    add_column :users, :address, :string
    add_column :users, :country, :string
    add_column :users, :apartment, :string
  end
end
