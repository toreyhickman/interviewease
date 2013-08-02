# require 'spec_helper'

# describe "interviewee tries to register for interview" do

#   before :each do
#     @candidate = Candidate.create(name: "Tommy Wiseau")
#     @candidate.interviews << Interview.create()
#   end

#   it "registers successfully" do
#     visit root_path
#     fill_in "Type in your interview code here", with: @candidate.interviews.last.identifier
#     click_button "Check In"
#     expect(page).to have_content "Challenge Description"
#   end

#   it "fails to register" do
#     visit root_path
#     fill_in "Type in your interview code here", with: "1234-5678-ABCD-EFGH"
#     click_button "Check In"
#     expect(page).to have_content "Couldn't find a interview for that key!"    
#   end

# end
