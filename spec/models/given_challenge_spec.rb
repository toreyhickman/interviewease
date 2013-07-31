require 'spec_helper'

describe GivenChallenge do

  context "validations" do
    it { should validate_uniqueness_of(:challenge_id).scoped_to(:interview_id) }
  end

  context "accessible attributes" do
    it { should allow_mass_assignment_of(:interview_id) }
    it { should allow_mass_assignment_of(:challenge_id) }
    it { should allow_mass_assignment_of(:candidate_id) }
  end

  context "associations" do
    it { should belong_to(:challenge) }
    it { should belong_to(:candidate) }
    it { should belong_to(:interview) }
  end

end
