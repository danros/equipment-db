class CreateNewStatuses < ActiveRecord::Migration
  def up
    ['Commissioning', 'On Order', 'Planned', 'Decommissioned'].each do |name|
      status = Status.new
      status.name = name
      status.severity = Status::Severity::ERROR
      status.save
    end
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
