require 'spec_helper'

describe "after company is registered" do

  before :each do
    visit root_path
    # @company = Company.create(name: "Apple")
    # p @company
    fill_in "Company Name", with: "Apple"
    fill_in "Enter your name", with: "Steve"
    fill_in "Enter your email", with: "steve@apple.com"
    fill_in "Enter your password", with: "password"
    click_button "Register"
  end

  it "logs out successfully" do
    click_link "Logout"
    expect(current_path).to eq root_path
    expect(page).to have_content "Employees: sign in here"
  end

  it "redirects to new employee form" do
    within("#employees") do
      click_on "+"
      expect(current_path).to eq new_employee_path
    end
  end

  it "creates a new employee" do
    @company = Company.last
    within("#employees") do
      click_on "+"
      expect(current_path).to eq new_employee_path
    end
    fill_in "employee_name", with: "Azuza"
    fill_in "employee_email", with: "azuza@pacific.com"
    fill_in "employee_password", with: "password"
    click_button "Add Employee"
    expect(current_path).to eq company_path(@company)
    expect(page).to have_content @company.name
  end

  it "redirects to new company page after new employee is created" do
    @company = Company.last
    within("#employees") do
      click_on "+"
      expect(current_path).to eq new_employee_path
    end
    fill_in "employee_name", with: "Azuza"
    fill_in "employee_email", with: "azuza@pacific.com"
    fill_in "employee_password", with: "password"
    click_button "Add Employee"
    expect(current_path).to eq company_path(@company)
    expect(page).to have_content "Azuza"
  end

  

end
