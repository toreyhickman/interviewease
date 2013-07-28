require 'spec_helper'

describe Company do

  context "validations" do
    it { should validate_presence_of(:name) }
    it { should validate_uniqueness_of(:name) }
  end

  context "accessible attributes" do
    it { should allow_mass_assignment_of(:name) }
  end

  context "associations" do
    it { should have_many(:feedback_questions) }
    it { should have_many(:employees) }
    it { should have_many(:candidates) }
    it { should have_many(:challenges) }
    it { should have_many(:topics) }
  end

end
