class MaintenanceAlertMailer < ActionMailer::Base
  def status_change(user, device)
    @user = user
    @device = device
    mail(:to => user.email, :subject => "[Makespace Maintenance Alert] #{device.name} marked as #{device.status.name}")
  end
end
