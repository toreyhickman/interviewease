require 'spec_helper'

describe Interview do

  context "validations" do
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
