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

require 'spec_helper'

describe User do
  before { @user = FactoryGirl.create(:user) }

  subject { @user }

  it { should respond_to(:name) }
  it { should respond_to(:email) }
  it { should respond_to(:active) }
  it { should respond_to(:password_digest) }
  it { should respond_to(:password) }
  it { should respond_to(:password_confirmation) }
  it { should respond_to(:authenticate) }
  it { should be_valid }

  it "should be marked active" do
    @user.active.should be_true
  end

  it "should have a default password" do
    @user.password.should_not be_nil
    @user.password_confirmation.should_not be_nil
    @user.password.should == @user.password_confirmation
    @user.password_digest.should_not be_nil
  end

  it "should have a default password of a good length" do
    @user.password.length.should > 20
    @user.password_confirmation.length.should > 20
  end

  it "should require password confirmation" do
    @user.password = 'somethingElse'
    @user.save.should be_false
  end

  it "should not have password 'foo'" do
    @user.authenticate('foo').should be_false
  end

  describe "when name is blank" do
    before { @user.name = " " }
    it { should_not be_valid }
  end

  describe "when email is blank" do
    before { @user.email = " " }
    it { should_not be_valid }
  end

  describe "when email is not unique" do
    let(:user_with_same_email) { @user.dup }

    subject { user_with_same_email }

    it { should_not be_valid }
  end

  describe "when email is valid" do
    it "should be valid" do
      addresses = %w[ foo@example.com local_part@example.com
                      adddress+tag@example.com
                      local.part-with-punctuation@example.com ]
      addresses.each do |valid_address|
        @user.email = valid_address
        @user.should be_valid
      end
    end
  end

  describe "when email is invalid" do
    it "should be invalid" do
      addresses = %w[ foo-at-example.com local_part@ @example.com ]
      addresses.each do |invalid_address|
        @user.email = invalid_address
        @user.should_not be_valid
      end
    end
  end

  describe "email address with mixed case" do
    let(:mixed_case_email) { "Foo@Example.com" }

    it "should be saved as lower case" do
      @user.email = mixed_case_email
      @user.save
      @user.reload.email.should == mixed_case_email.downcase
    end
  end  
end

describe "a user with password 'foo'" do
  before { @user = FactoryGirl.create(:user_with_password_foo) }
  subject { @user }

  describe "should have a non-nil password digest" do
    let(:password_digest) { @user.password_digest }
    specify { password_digest.should_not be_nil }
  end

  it "has password 'foo'" do
    @user.authenticate('foo').should be_true
  end

  it "does not have password 'bar'" do
    @user.authenticate('bar').should be_false
  end

  it "does not have a blank password" do
    @user.authenticate('').should be_false
  end

  describe "after changing it to 'buzz'" do
    before do
      @user.password = 'buzz'
      @user.password_confirmation = 'buzz'
      @user.save
    end

    it "has password 'buzz'" do
      @user.authenticate('buzz').should be_true
    end

    it "does not have password 'foo'" do
      @user.authenticate('foo').should be_false
    end
  end

  describe "can be looked up by email" do
    let(:found_user) { User.find_by_email('joe_example@example.com') }

    it { should == found_user }

    specify { found_user.authenticate('foo').should be_true }
    specify { found_user.authenticate('bar').should be_false }
  end
end
