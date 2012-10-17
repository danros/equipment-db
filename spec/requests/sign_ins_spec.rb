require 'spec_helper'

describe "before signing in" do
  describe "the home page" do
    it "has a sign-in link" do
      visit root_path
      page.should have_link('Sign in', href: new_user_session_path)
    end

    # FIXME: For the moment, we're making use of the default Devise views.
    #it "has a sign-in button" do
    #  visit root_path
    #  within('.hero-unit') do
    #    page.should have_link('Sign in', href: new_user_session_path)
    #  end
    #end
  end
end

describe "after signing in correctly" do
  let(:user) { FactoryGirl.create(:user_with_password_foobar) }

  before do
    visit new_user_session_path
    fill_in 'user_email', with: user.email
    fill_in 'user_password', with: user.password
    click_button 'Sign in'
  end

  it "removes sign in link" do
    visit root_path
    page.should_not have_link('Sign in', href: new_user_session_path)
  end

  it "adds a sign out link" do
    page.should have_link('Sign out', href: destroy_user_session_path)
  end
end

describe "signing in incorrectly" do
  let(:user) { FactoryGirl.create(:user_with_password_foobar) }

  before do
    visit new_user_session_path
    fill_in 'user_email', with: user.email
    fill_in 'user_password', with: 'not the password'
    click_button 'Sign in'
  end

  it "keeps the sign in link" do
    page.should have_link('Sign in', href: new_user_session_path)
  end

  describe "shows an error" do
    specify "with the right HTML class" do
      page.should have_selector('div.alert.alert-alert')
    end

    specify "which is shown once" do
      visit root_path
      page.should_not have_selector('div.alert.alert-error', text: 'incorrect')
    end
  end
end
