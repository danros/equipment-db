require 'spec_helper'

describe "the home page" do
  it "has a sign-up button" do
    visit root_path
    within('.hero-unit') do
      page.should have_link('Create account', href: new_user_path)
    end
  end
end
