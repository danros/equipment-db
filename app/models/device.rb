# == Schema Information
#
# Table name: devices
#
#  id         :integer          not null, primary key
#  name       :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Device < ActiveRecord::Base
  attr_accessible :name, :tag
  
  validates :name, presence: true

  has_many :asset_tags
  has_many :owners
end
