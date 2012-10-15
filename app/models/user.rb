# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  name            :text             not null
#  email           :text             not null
#  active          :boolean          default(TRUE), not null
#  password_digest :text
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class User < ActiveRecord::Base
  attr_accessible :password, :password_confirmation, :active, :email, :name

  before_save { |user| user.email = email.downcase }

  has_secure_password
    
  # Allow user creation without specifying a password by randomly generating a
  # 32-byte (==256-bit) password. Obviously the user cannot log in without
  # knowing the password but it lets us create users a) who authenticate by
  # some manner other than passwords and b) whose password is to be set at a
  # later time.
  before_validation do |user|
    if not user.password
      random_password = SecureRandom.random_bytes(32)
      self.password = random_password
      self.password_confirmation = random_password
    end
  end

  validates :name, presence: true

  # A very light-touch email verification. The only thing one can really state
  # with certainty is there should be an '@' sign which isn't at either end.
  validates :email, presence:   true,
                    format:     { with: /.+@.+/ },
                    uniqueness: { case_sensitive: false }

  validates :password, presence: true, length: { minimum: 6 }
end
