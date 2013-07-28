require 'spec_helper'

describe CoveredTopic do

  context "validations" do
  end

  context "accessible attributes" do
  end

  context "associations" do
    it { should belong_to(:topic) }
    it { should belong_to(:candidate) }
  end

end
