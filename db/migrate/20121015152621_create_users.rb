class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.text :name, null: false
      t.text :email, null: false
      t.boolean :active, null: false, default: true
      t.text :password_digest, null: false, default: ''

      t.timestamps
    end

    # ensure all users have a unique email address
    add_index :users, :email, unique: true
  end
end
