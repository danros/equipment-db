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
end
