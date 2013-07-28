require 'spec_helper'

describe FeedbackQuestion do

  context "validations" do
    it { should validate_presence_of(:prompt) }
  end

  context "accessible attributes" do
    it { should allow_mass_assignment_of(:prompt) }
  end

  context "associations" do
    it { should belong_to(:question) }
    it { should have_many(:feedback_responses) }
  end

end
