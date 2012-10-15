class AddSeverityToStatus < ActiveRecord::Migration
  def change
    add_column :statuses, :severity, :integer, default: StatusSeverity::INFO, null: false

    # Set the severity of each status using the old rule that Damaged == a
    # warning and Inoperable == an error.
    Status.all.each do |status|
      case status.name
      when "Damaged"
        status.severity = StatusSeverity::WARNING
      when "Inoperable" 
        status.severity = StatusSeverity::ERROR
      else
        status.severity = StatusSeverity::INFO
      end

      status.save
    end
  end
end
