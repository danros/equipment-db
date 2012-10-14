require 'spec_helper'

describe "before signing in" do
  describe "the home page" do
    it "has a sign-in link" do
      visit root_path
      page.should have_link('Sign in', href: new_session_path)
    end

    it "has a sign-in button" do
      visit root_path
      within('.hero-unit') do
        page.should have_link('Sign in', href: new_session_path)
      end
    end
  end
end

describe "after signing in correctly" do
  before do
    visit new_session_path
    fill_in 'Username:', with: 'FIXME: ignored'
    fill_in 'Password:', with: 'mak3spac3'
    click_button 'Sign in'
  end

  it "removes sign in link" do
    visit root_path
    page.should_not have_link('Sign in', href: new_session_path)
  end

  it "adds a sign out link" do
    page.should have_link('Sign out', href: signout_path)
  end
end

describe "signing in incorrectly" do
  before do
    visit new_session_path
    fill_in 'Username:', with: 'FIXME: ignored'
    fill_in 'Password:', with: 'not the password'
    click_button 'Sign in'
  end

  it "keeps the sign in link" do
    page.should have_link('Sign in', href: new_session_path)
  end

  describe "shows an error" do
    specify "with the right HTML class and content" do
      page.should have_selector('div.alert.alert-error', text: 'incorrect')
    end

    specify "which is shown once" do
      visit root_path
      page.should_not have_selector('div.alert.alert-error', text: 'incorrect')
    end
  end
end
