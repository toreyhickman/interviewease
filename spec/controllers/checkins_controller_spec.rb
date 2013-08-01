require 'spec_helper'

describe CheckinsController, :type => :controller do
  describe 'POST #create' do
    before do
      @company = Company.create(name: "test")
      @employee = @company.employees.create(name: "test", email: "test", password: "test")
      @candidate = @company.candidates.create(name: "test")
      @interview = @employee.interviews.create(candidate_id: @candidate.id)
    end
    it "should redirect to the interview if found" do
      post :create, identifier: @interview.identifier
      response.should redirect_to interview_path(@interview.identifier)
    end

    it "should redirect to home page if not found" do
      post :create, identifier: "WRONG-IDENTIFIER"
      response.should redirect_to root_url
    end
  end
end
