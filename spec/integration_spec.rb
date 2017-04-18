require 'rails_helper'

feature "signing up" do

  scenario "has a new user page" do
    visit new_user_registration_url
    expect(page).to have_content "Sign up"
  end

  feature "signing up a user" do
    before(:each) do
      visit new_user_registration_url
      fill_in 'user_email', :with => "sample@test.com"
      fill_in 'user_fname', :with => "John"
      fill_in 'user_lname', :with => "Smith"
      fill_in 'user_password', :with => "password"
      fill_in 'user_password_confirmation', :with => "password"
      click_button "Sign up"
    end

    scenario "redirects to homepage after signup" do
      expect(page).to have_content "Post Title"
    end

    scenario "shows username on the homepage after signup" do
      expect(page).to have_content "John Smith"
    end
  end

end
