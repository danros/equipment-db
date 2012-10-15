class CreateMaintainersRelationship < ActiveRecord::Migration
  def up
    create_table :devices_maintainers do |t|
      t.integer :device_id
      t.integer :user_id
      t.timestamps
    end
  end

  def down
    drop_table :devices_maintainers
  end
end
