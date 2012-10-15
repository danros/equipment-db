class AddSeverityToStatus < ActiveRecord::Migration
  def change
    add_column :statuses, :severity, :integer, default: Status::Severity::INFO, null: false

    # Set the severity of each status using the old rule that Damaged == a
    # warning and Inoperable == an error.
    Status.all.each do |status|
      case status.name
      when "Damaged"
        status.severity = Status::Severity::WARNING
      when "Inoperable" 
        status.severity = Status::Severity::ERROR
      else
        status.severity = Status::Severity::INFO
      end

      status.save
    end
  end
end
