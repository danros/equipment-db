# == Schema Information
#
# Table name: asset_tags
#
#  id         :integer          not null, primary key
#  code       :string(255)
#  active     :boolean
#  created_at :datetime
#  updated_at :datetime
#  device_id  :integer
#

require 'spec_helper'

describe AssetTag do
  before { @tag = AssetTag.new(:code => 'ABCDEF012345', :active => true) }

  subject { @tag }

  # The basic invariants of the test tag.
  it { should respond_to(:code) }
  it { should respond_to(:active) }
  it { should respond_to(:device_id) }
  it { should be_valid }

  describe "when code is not present" do
    before { @tag.code = " " }
    it { should_not be_valid }
  end

  describe "when tag code is already used" do
    before do
      # save a copy of the tag in the database with the same code => @tag should be invalid
      tag_with_identical_code = @tag.dup
      tag_with_identical_code.save
    end

    it { should_not be_valid }
  end
end
