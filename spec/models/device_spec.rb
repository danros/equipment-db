# == Schema Information
#
# Table name: devices
#
#  id            :integer          not null, primary key
#  name          :text
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  status_id     :integer
#  reference_url :text
#

require 'spec_helper'

describe Device do
  before { @device = Device.new(:name => 'Test device') }

  subject { @device }

  # The basic invariants of the test tag.
  it { should respond_to(:name) }
  it { should respond_to(:asset_tags) }
  it { should respond_to(:owners) }
  it { should be_valid }

  describe "when name is not present" do
    before { @device.name = " " }
    it { should_not be_valid }
  end
end

