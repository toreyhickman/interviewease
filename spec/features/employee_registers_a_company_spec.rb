require 'spec_helper'

describe "employee registers a company" do

  it "successfully creates a company and employee" do
    visit root_path
    fill_in "Company Name", with: "Vandelay Industries"
    fill_in "Enter your name", with: "Carl Spackler"
    fill_in "Enter your email", with: "carl@caddyshack.com"
    fill_in "Enter your password", with: "dalailama"
    click_button "Register"
    expect(page).to have_content "Logged in as carl@caddyshack.com"
    expect(page).to have_content "Carl Spackler"
    expect(page).to have_content "Vandelay Industries Home"
  end

  it "fails to create an employee" do
    visit root_path
    fill_in "Company Name", with: "Vandelay Industries"
    click_button "Register"
    expect(page).to have_content "Employee fields must not be blank"
  end

  it "fails to create a company" do
    visit root_path
    fill_in "Enter your name", with: "Carl Spackler"
    fill_in "Enter your email", with: "carl@caddyshack.com"
    fill_in "Enter your password", with: "dalailama"
    click_button "Register"
    expect(page).to have_content "Company name must not be blank"
  end

end
