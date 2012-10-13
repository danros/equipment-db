class CreateAssetTags < ActiveRecord::Migration
  def change
    # Add asset tags table
    create_table :asset_tags do |t|
      t.string :code
      t.boolean :active

      t.timestamps
    end

    # Ensure uniqueness of asset tags in database
    add_index :asset_tags, :code, unique: true

    # Remove tag field from device
    remove_column :devices, :tag
  end
end
