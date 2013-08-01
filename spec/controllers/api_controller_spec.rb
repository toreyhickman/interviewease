require 'spec_helper'

describe ApiController, :type => :controller do
  before do
    @company = Company.create(name: "test")
    @employee = @company.employees.create(name: "test", email: "test", password: "test")
    @challenge = @company.challenges.create(title: "test", description: "test", code: "test")
    @challenge.author = @employee
    @challenge.save
    @candidate = @company.candidates.create(name: "test")
    @interview = @employee.interviews.create(candidate_id: @candidate.id)
  end

  describe 'POST #update_code' do
    it "posts the updated code to Pusher" do
      pending "Not sure how to test pusher channel"
    end
  end

  describe 'POST #update_challenge' do
    it "assigns the requested challenge to challenge" do
      # post :update_challenge, challenge_id: @challenge.id, candidate_id: @candidate.id, interview_id: @interview.id
      # assigns(:challenge).should eq @challenge
      pending "Not sure how to get into eventmachine loop"
    end

    it "posts the challenge to Pusher" do
      pending "Not sure how to test pusher channel"
    end

    it "creates a GivenChallenge record" do
      # expect { post :update_challenge, challenge_id: @challenge.id, candidate_id: @candidate.id, interview_id: @interview.id
      #   }.to change { GivenChallenge.count }.by(1)
      pending "Not sure how to get into eventmachine loop"
    end
  end

  describe 'POST #run_code' do
    it "saves params[:code] to a local file" do
      pending "Not sure how to test pusher channel"
    end

    it "uploads the local file to the remote server" do
      pending "Not sure how to test pusher channel"
    end

    it "posts the code result to Pusher" do
      pending "Not sure how to test pusher channel"
    end
  end
end
