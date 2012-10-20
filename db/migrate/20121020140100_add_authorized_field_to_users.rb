class AddAuthorizedFieldToUsers < ActiveRecord::Migration
  def change
    add_column :users, :authorized, :boolean, :null => false, :default => false
  end
end
