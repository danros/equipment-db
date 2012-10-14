require 'spec_helper'

describe "Signing in" do
  describe "doesn't happen by default" do
    it "and has a sign-in link" do
      visit root_path
      page.should have_link('Sign in', href: new_session_path)
    end
  end
end
