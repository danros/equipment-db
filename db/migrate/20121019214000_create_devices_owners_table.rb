class CreateDevicesOwnersTable < ActiveRecord::Migration
  def change
    create_table :devices_owners do |t|
      t.integer :device_id
      t.integer :owner_id
    end
  end
end
