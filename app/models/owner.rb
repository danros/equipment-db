# == Schema Information
#
# Table name: owners
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  email      :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  device_id  :integer
#

class Owner < ActiveRecord::Base
  attr_accessible :email, :name

  before_save { |owner| owner.email = email.downcase }

  belongs_to :device

  validates :name, presence: true

  # A very light-touch email verification. The only thing one can really state
  # with certainty is there should be an '@' sign which isn't at either end.
  validates :email, presence:   true,
                    format:     { with: /.+@.+/ },
                    uniqueness: { case_sensitive: false }
end
