module Reports
  class Accounting
    def devices
      if Rails.env == 'production'
        Device.find(:all, :conditions => '(minor_item = FALSE) OR (minor_item IS NULL)')
      else
        Device.find(:all, :conditions => '(minor_item = "f") OR (minor_item IS NULL)')
      end
    end
  end
end
