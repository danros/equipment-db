# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  name                   :text             not null
#  email                  :text             not null
#  active                 :boolean          default(TRUE), not null
#  password_digest        :text             default(""), not null
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  encrypted_password     :string(255)      default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0)
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  confirmation_token     :string(255)
#  confirmed_at           :datetime
#  confirmation_sent_at   :datetime
#  unconfirmed_email      :string(255)
#

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :active, :name

  before_save { |user| user.email = email.downcase }

  # Allow user creation without specifying a user name by using the email field
  # if necessary. In addition, allow user creation without specifying a
  # password by randomly generating a 32-byte (==256-bit) password. Obviously
  # the user cannot log in without knowing the password but it lets us create
  # users a) who authenticate by some manner other than passwords and b) whose
  # password is to be set at a later time.
  before_validation do |user|
    if not user.name
      user.name = user.email
    end

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

  has_and_belongs_to_many :devices, :join_table => :devices_maintainers
  has_and_belongs_to_many :roles

  def authenticate(password)
    self if self.valid_password?(password)
  end

  def authorized?
    puts roles.inspect
    r = roles.find_all_by_name("Authorized User").size > 0
    puts r.inspect
    r
  end

  def authorized=(value)
    role = Role.find_by_name("Authorized User")
    if(value && !authorized?)
      roles << role
    elsif(!value && authorized?)
      roles.destroy(role)
    end
  end
end
