require 'spec_helper'

describe Candidate do

  context "validations" do
    it { should validate_presence_of(:name) }
    it { should validate_uniqueness_of(:name) }
  end

  context "accessible attributes" do
    it { should allow_mass_assignment_of(:email) }
    it { should allow_mass_assignment_of(:name) }
  end

  context "associations" do
    it { should belong_to(:company) }
    it { should have_many(:interviews) }
    it { should have_many(:interviewers).through(:interviews) }
    it { should have_many(:given_challenges) }
    it { should have_many(:attempted_challenges).through(:given_challenges) }
    it { should have_many(:covered_topics) }
    it { should have_many(:addressed_topics).through(:covered_topics) }
  end

end
