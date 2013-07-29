require 'spec_helper'

describe Interview do

  let(:interview) { Interview.create(employee_id: 1, candidate_id: 1) }

  context "validations" do
    it { should validate_presence_of(:candidate_id) }
    it { should validate_uniqueness_of(:identifier) }
  end

  context "accessible attributes" do
    it { should allow_mass_assignment_of(:start) }
    it { should allow_mass_assignment_of(:complete) }
  end

  context "associations" do
    it { should belong_to(:employee) }
    it { should belong_to(:candidate) }
    it { should have_many(:given_challenges) }
    it { should have_many(:challenges).through(:given_challenges) }
  end

  context "before_create callback" do
    it "does not call create_identifier before save" do
      interview.should_not_receive(:create_identifier)
      interview.save
    end

    it "assigns a 19-character-long string to identifier before create" do
      interview.identifier.length.should eq 19
    end
  end

  context "to_param from identifier" do
    it "customizes the url from the identifier" do
      interview.to_param.should == interview.identifier
    end
  end

end
