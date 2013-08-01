require 'spec_helper'

describe ApiController, :type => :controller do
  before do
    @company = Company.create(name: "test")
    @employee = @company.employees.create(name: "test", email: "test", password: "test")
    @challenge = @company.challenges.create(title: "test", description: "test", code: "test", test_code: "test", author_id: @employee.id)
    @candidate = @company.candidates.create(name: "test")
    @interview = @employee.interviews.create(candidate_id: @candidate.id)
  end

  describe 'POST #update_code' do
    it "posts the updated code to Pusher" do
      pending
    end
  end

  describe 'POST #update_challenge' do
    it "assigns the requested challenge to challenge" do
      post :update_challenge, challenge_id: @challenge.id, candidate_id: @candidate.id, interview_id: @interview.id
      assigns(:challenge).should eq @challenge
    end

    it "posts the challenge to Pusher" do
      pending
    end

    it "creates a GivenChallenge record" do
      expect { post :update_challenge, challenge_id: @challenge.id, candidate_id: @candidate.id, interview_id: @interview.id
        }.to change { GivenChallenge.count }.by(1)
    end
  end

  describe 'POST #run_code' do
    it "saves params[:code] to a local file" do
      pending
    end

    it "uploads the local file to the remote server" do
      pending
    end

    it "posts the code result to Pusher" do
      pending
    end
  end
end
