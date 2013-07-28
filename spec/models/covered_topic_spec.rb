require 'spec_helper'

describe CoveredTopic do

  context "validations" do
    it { should validate_presence_of(:name) }
    it { should validate_present_of(:email) }
    it { should validate}
  end

  context "accessible attributes" do
  end

  context "associations" do
    it { should belong_to(:topic) }
    it { should belong_to(:candidate) }
  end

end
