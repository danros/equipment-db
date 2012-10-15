# == Schema Information
#
# Table name: statuses
#
#  id       :integer          not null, primary key
#  name     :text
#  severity :integer
#

class Status < ActiveRecord::Base
  has_many :devices

  # A class allowing specification of severity for a particular device status
  # See Status.severity
  class Severity
    INFO      = 0
    WARNING   = 1
    ERROR     = 2
  end
end
