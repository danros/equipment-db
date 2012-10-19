# == Schema Information
#
# Table name: owners
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  email      :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'spec_helper'

describe Owner do
  before { @owner = Owner.new(name: 'Makespace', email: 'info@example.com') }

  subject { @owner }
  
  it { should respond_to(:name) }
  it { should respond_to(:email) }
  it { should be_valid }

  describe "when name is blank" do
    before { @owner.name = " " }
    it { should_not be_valid }
  end

  describe "when email is blank" do
    before { @owner.email = " " }
    it { should_not be_valid }
  end

  describe "when email is not unique" do
    before do
      owner_with_same_email = @owner.dup
      owner_with_same_email.save
    end

    it { should_not be_valid }
  end

  describe "when email is valid" do
    it "should be valid" do
      addresses = %w[ foo@example.com local_part@example.com
                      adddress+tag@example.com
                      local.part-with-punctuation@example.com ]
      addresses.each do |valid_address|
        @owner.email = valid_address
        @owner.should be_valid
      end
    end
  end

  describe "when email is invalid" do
    it "should be invalid" do
      addresses = %w[ foo-at-example.com local_part@ @example.com ]
      addresses.each do |invalid_address|
        @owner.email = invalid_address
        @owner.should_not be_valid
      end
    end
  end

  describe "email address with mixed case" do
    let(:mixed_case_email) { "Foo@Example.com" }

    it "should be saved as lower case" do
      @owner.email = mixed_case_email
      @owner.save
      @owner.reload.email.should == mixed_case_email.downcase
    end
  end  

end
