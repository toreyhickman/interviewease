# require 'spec_helper'

# describe "employee tries to in" do

#   before :each do
#     @user = Employee.create(name: "Fake", email: "fake@fake.fake", password: "password")
#     company = Company.create(name: "Prestige Worldwide")
#     company.employees << @user
#   end

#   it "signs in successfully and redirects to the interview page" do
#     visit root_path
#     fill_in "Email", with: "fake@fake.fake"
#     fill_in "Password", with: "password"
#     click_button "Sign In"
#     expect(current_path).to eq employee_path(@user)
#     expect(page).to have_content "Scheduled Interviews"
#   end

#   it "fails to sign in" do
#     visit root_path
#     fill_in "Email", with: "fake@dbc.com"
#     fill_in "Password", with: "password"
#     click_button "Sign In"
#     expect(current_path).to eq root_path
#     # expect(page).to have_content "Incorrect email or password"
#     expect(page).to have_content "Employees: sign in here"
#   end

# end
