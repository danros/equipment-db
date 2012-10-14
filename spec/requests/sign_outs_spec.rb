require 'spec_helper'

describe "signing out" do
  describe "before signing in" do
    it "does not have a sign out link" do
      visit root_path
      page.should_not have_link('Sign out', href: signout_path)
    end
  end

  describe "after signing in" do
    before do
      visit new_session_path
      fill_in 'Username:', with: 'FIXME: ignored'
      fill_in 'Password:', with: 'mak3spac3'
      click_button 'Sign in'
    end

    it "removes sign out link" do
      visit signout_path
      page.should_not have_link('Sign out', href: signout_path)
    end

    it "adds a sign in link" do
      visit signout_path
      page.should have_link('Sign in', href: new_session_path)
    end
  end
end
