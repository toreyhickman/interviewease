require 'spec_helper'

describe FeedbackResponse do

  context "validations" do
    it { should validate_presence_of(:response) }
  end

  context "accessible attributes" do
    it { should allow_mass_assignment_of(:response) }
    it { should allow_mass_assignment_of(:feedback_question_id) }
    it { should allow_mass_assignment_of(:candidate_id) }
  end

  context "associations" do
    it { should belong_to(:feedback_question) }
    it { should belong_to(:candidate) }
    it { should belong_to(:employee) }
  end

end
