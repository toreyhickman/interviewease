require 'spec_helper'

describe Employee do

  context "validations" do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:email) }
    it { should validate_uniqueness_of(:email) }
    it { should validate_presence_of(:password_hash) }
  end

  context "accessible attributes" do
    it { should allow_mass_assignment_of(:email) }
    it { should allow_mass_assignment_of(:name) }
    it { should allow_mass_assignment_of(:password_hash) }
    it { should allow_mass_assignment_of(:password) }
  end

  context "associations" do
    it { should belong_to(:company) }
    it { should have_many(:interviews) }
    it { should have_many(:interviewees).through(:interviews) }
    it { should have_many(:feedback_responses) }
    it { should have_many(:written_challenges).class_name("Challenge").with_foreign_key(:author_id) }
  end

  context "bcrypt" do
    it "has entered password encrypted" do
      employee = Employee.create(name: "Joe", email: "joe@yo.com", password: "test")
      employee.password_hash.length.should eq 60
    end
  end

end
