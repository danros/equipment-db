class MaintenanceAlertMailer < ActionMailer::Base
  def status_change(user, device)
    recipients "#{user.name} <#{user.email}>"
    from "Makespace Equipment Database"
    subject "[Makespace Maintenance Alert] #{device.name} marked as #{device.status.name}"
    sent_on Time.now
    body {:user => user, :device => device}
  end
end
