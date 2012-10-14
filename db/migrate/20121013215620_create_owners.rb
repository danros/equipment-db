class CreateOwners < ActiveRecord::Migration
  def change
    create_table :owners do |t|
      t.string :name
      t.string :email

      t.timestamps
    end

    # Ensure that all owners have a unique name
    add_index :owners, :email, unique: true
  end
end
