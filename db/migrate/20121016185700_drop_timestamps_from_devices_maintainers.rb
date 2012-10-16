class DropTimestampsFromDevicesMaintainers < ActiveRecord::Migration
  def change
    remove_column :devices_maintainers, :created_at
    remove_column :devices_maintainers, :updated_at
  end
end
