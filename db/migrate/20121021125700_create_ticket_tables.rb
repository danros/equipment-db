class CreateTicketTables < ActiveRecord::Migration
  def change
    create_table :tickets do |t|
      t.text :summary
      t.text :details
      t.integer :device_id
      t.integer :user_id
      t.integer :ticket_status_id
      t.timestamps
    end

    create_table :ticket_statuses do |t|
      t.text :name
    end

    execute 'INSERT INTO ticket_statuses (name) VALUES (\'open\')'
    execute 'INSERT INTO ticket_statuses (name) VALUES (\'resolved\')'
    execute 'INSERT INTO ticket_statuses (name) VALUES (\'invalid\')'
  end
end
