class AddModelToDevicesTable < ActiveRecord::Migration
  def change
    add_column :devices, :model, :text
  end
end
