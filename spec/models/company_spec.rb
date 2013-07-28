require 'spec_helper'

describe Company do

  context "validations" do
  end

  context "accessible attributes" do
  end

  context "associations" do
    it { should have_many(:feedback_questions) }
    it { should have_many(:employees) }
    it { should have_many(:candidates) }
    it { should have_many(:challenges) }
    it { should have_many(:topics) }
  end

end
