# == Schema Information
#
# Table name: statuses
#
#  id       :integer          not null, primary key
#  name     :text
#  severity :integer          default(0), not null
#

require 'spec_helper'

describe Status do
  describe "all statuses in the database" do
    Status.all.each do |status|
      subject { status }
      it "should have a non-nill severity" do
        status.severity should_not be_nil
      end
    end
  end
end
