class AddAccountingData < ActiveRecord::Migration
  def up
    add_column :devices, :provenance_id, :integer
    add_column :devices, :date_acquired, :date
    add_column :devices, :value_when_acquired, :float
    add_column :devices, :minor_item, :boolean

    create_table :provenances do |t|
      t.text :name
    end

    execute 'INSERT INTO provenances (name) VALUES (\'Purchase (new)\')'
    execute 'INSERT INTO provenances (name) VALUES (\'Purchase (used)\')'
    execute 'INSERT INTO provenances (name) VALUES (\'Donation\')'
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
