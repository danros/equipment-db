class AddPatDateToDevices < ActiveRecord::Migration
  def change
    add_column :devices, :pat_date, :date
  end
end
