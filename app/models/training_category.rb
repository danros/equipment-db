class TrainingCategory < ActiveRecord::Base
  attr_accessible :name, :rgb
  has_many :devices
end
