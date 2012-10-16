require 'spec_helper'

describe "signing out" do
  describe "before signing in" do
    it "does not have a sign out link" do
      visit root_path
      page.should_not have_link('Sign out', href: destroy_user_session_path)
    end
  end

  describe "after signing in" do
    let(:user) { FactoryGirl.create(:user_with_password_foobar) }

    before do
      visit new_user_session_path
      fill_in 'user_email', with: user.email
      fill_in 'user_password', with: user.password
      click_button 'Sign in'
      click_link 'Sign out'
    end

    it "removes sign out link" do
      page.should_not have_link('Sign out', href: destroy_user_session_path)
    end

    it "adds a sign in link" do
      page.should have_link('Sign in', href: new_user_session_path)
    end
  end
end
