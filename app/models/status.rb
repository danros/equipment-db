class Status < ActiveRecord::Base
  has_many :devices
end