require 'spec_helper'

describe Challenge do

  context "validations" do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:description) }
    it { should validate_presence_of(:code) }
    it { should validate_presence_of(:test_code) }
  end

  context "accessible attributes" do
    it { should allow_mass_assignment_of(:title) }
    it { should allow_mass_assignment_of(:description) }
    it { should allow_mass_assignment_of(:code) }
    it { should allow_mass_assignment_of(:test_code) }
    it { should allow_mass_assignment_of(:public) }
  end

  context "associations" do
    it { should belong_to(:company) }
    it { should belong_to(:author).class_name("Employee") }
    it { should have_many(:given_challenges) }
    it { should have_many(:attempters).through(:given_challenges) }
    it { should have_many(:feedback_questions) }
  end

end
