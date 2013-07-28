require 'spec_helper'

describe Topic do

  context "validations" do
    it { should validate_presence_of(:name) }
    it { should validate_uniqueness_of(:name).scoped_to(:company_id) }
  end

  context "accessible attributes" do
    it { should allow_mass_assignment_of(:name) }
    it { should allow_mass_assignment_of(:company_id) }
  end

  context "associations" do
    it { should belong_to(:company) }
    it { should have_many(:covered_topics) }
    it { should have_many(:candidates).through(:covered_topics) }
  end

end
