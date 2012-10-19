class DropDeviceIdFromOwners < ActiveRecord::Migration
  def change
    remove_column :owners, :device_id
  end
end
