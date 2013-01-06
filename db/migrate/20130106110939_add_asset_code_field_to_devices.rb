class AddAssetCodeFieldToDevices < ActiveRecord::Migration
  def change
    add_column :devices, :asset_code, :text
  end
end
