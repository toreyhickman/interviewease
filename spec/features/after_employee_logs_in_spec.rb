# require 'spec_helper'

# describe 'after employee logs in' do

#   before :each do
#     @user = Employee.create(name: "Fake", email: "fake@fake.fake", password: "password")
#     @company = Company.create(name: "Prestige Worldwide")
#     @company.employees << @user
#     visit root_path
#     fill_in "Email", with: "fake@fake.fake"
#     fill_in "Password", with: "password"
#     click_button "Sign In"    
#   end

#   it "logs out successfully" do
#     click_link "Logout"
#     expect(current_path).to eq root_path
#     expect(page).to have_content "Employees: sign in here"
#   end

#   it "redirects to 'edit profile' page upon correct click" do
#     click_link "edit profile"
#     expect(current_path).to eq edit_employee_path(@user)
#     expect(page).to have_content "Edit Employee:"    
#   end

#   it "creates a new interview" do
#     fill_in "Who will you be interviewing?", with: "Ted"
#     click_button "Create Candidate"
#     expect(page).to have_content "Ted"
#   end

# end
