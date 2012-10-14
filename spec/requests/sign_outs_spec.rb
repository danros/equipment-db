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
      visit signout_path
    end

    it "removes sign out link" do
      page.should_not have_link('Sign out', href: signout_path)
    end

    it "adds a sign in link" do
      page.should have_link('Sign in', href: new_session_path)
    end

    describe "displays an information alert" do
      specify "with the right HTML class and content" do
        page.should have_selector('div.alert.alert-info', text: 'signed out')
      end

      specify "which is shown once" do
        visit root_path
        page.should_not have_selector('div.alert.alert-info', text: 'signed out')
      end
    end
  end
end
