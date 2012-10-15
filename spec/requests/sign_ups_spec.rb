require 'spec_helper'

describe "signing up" do
  before do
    visit new_user_path
    fill_in 'Name', with: 'Mark Anthony'
    fill_in 'Email address', with: 'mark@example.com'
    fill_in 'user_password', with: 'foobarbuzz'
    fill_in 'user_password_confirmation', with: 'foobarbuzz'
    click_button 'Create my account'
  end

  it "removes sign up box" do
    visit root_path
    page.should_not have_selector('input', 'Create my account')
  end

  describe "with no name" do
    before do
      visit new_user_path
      fill_in 'Email address', with: 'mark@example.com'
      click_button 'Create my account'
    end

    it "fails" do
      page.should have_selector('.field_with_errors input#user_name')
    end
  end

  describe "with no email" do
    before do
      visit new_user_path
      fill_in 'Name', with: 'Mark Anthony'
      click_button 'Create my account'
    end

    it "fails" do
      page.should have_selector('.field_with_errors input#user_email')
    end
  end

  describe "with invalid email" do
    before do
      visit new_user_path
      fill_in 'Name', with: 'Mark Anthony'
      fill_in 'Email address', with: '@example.com'
      click_button 'Create my account'
    end

    it "fails" do
      page.should have_selector('.field_with_errors input#user_email')
    end
  end

  describe "with mismatched passwords" do
    before do
      visit new_user_path
      fill_in 'Name', with: 'Mark Anthony'
      fill_in 'Email address', with: 'mark@example.com'
      fill_in 'user_password', with: 'foobar'
      fill_in 'user_password_confirmation', with: 'foobarbuzz'
      click_button 'Create my account'
    end

    it "fails" do
      page.should have_selector('.field_with_errors input#user_password')
    end
  end

  describe "with short password" do
    before do
      visit new_user_path
      fill_in 'Name', with: 'Mark Anthony'
      fill_in 'Email address', with: 'mark@example.com'
      fill_in 'user_password', with: 'foo'
      fill_in 'user_password_confirmation', with: 'foo'
      click_button 'Create my account'
    end

    it "fails" do
      page.should have_selector('.field_with_errors input#user_password')
    end
  end
end
