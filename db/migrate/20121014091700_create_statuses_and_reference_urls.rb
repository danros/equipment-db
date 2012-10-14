class CreateStatusesAndReferenceUrls < ActiveRecord::Migration
  def up
    create_table :statuses do |t|
      t.text :name
    end

    execute 'INSERT INTO statuses (name) VALUES ("Working")'
    execute 'INSERT INTO statuses (name) VALUES ("Degraded")'
    execute 'INSERT INTO statuses (name) VALUES ("Inoperable")'

    add_column :devices, :status_id, :integer
    add_column :devices, :reference_url, :text
  end

  def down
    drop_table :statuses
    
    remove_column :devices, :status_id
    remove_column :devices, :reference_url
  end
end
