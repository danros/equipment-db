class DropOwnerEmailUniquenessConstraint < ActiveRecord::Migration
  def up
    remove_index :owners, :email
  end

  def down
    add_index :owners, :email, :unique => true
  end
end
