# == Schema Information
#
# Table name: asset_tags
#
#  id         :integer          not null, primary key
#  code       :string(255)
#  active     :boolean
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class AssetTag < ActiveRecord::Base
  attr_accessible :active, :code

  belongs_to :device

  # Ensure the asset tag code is present _and_ unique
  validates :code, presence: true, uniqueness: true
end
