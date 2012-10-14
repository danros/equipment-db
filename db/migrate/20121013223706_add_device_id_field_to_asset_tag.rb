class AddDeviceIdFieldToAssetTag < ActiveRecord::Migration
  def change
    add_column :asset_tags, :device_id, :integer
    add_column :owners, :device_id, :integer
  end
end
