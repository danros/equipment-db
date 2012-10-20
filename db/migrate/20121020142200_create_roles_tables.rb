class CreateRolesTables < ActiveRecord::Migration
  def change
    create_table :roles do |t|
      t.text :name
    end

    create_table :roles_users do |t|
      t.integer :role_id
      t.integer :user_id
    end

    execute 'INSERT INTO roles (name) VALUES (\'Authorized User\')'
  end
end
