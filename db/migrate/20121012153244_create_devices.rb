class CreateDevices < ActiveRecord::Migration
  def change
    create_table :devices do |t|
      t.text :name
      t.text :tag

      t.timestamps
    end
  end
end
