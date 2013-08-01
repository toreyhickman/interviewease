require 'spec_helper'

describe ApiController, :type => :controller do
  describe 'POST #update_code' do
    it "should post the updated code to Pusher" do
      pending
    end
  end

  describe 'POST #update_challenge' do
    it "should assign the requested challenge to challenge" do
      pending
    end

    it "should post the challenge object to Pusher" do
      pending
    end

    it "should create a GivenChallenge record" do
      pending
    end
  end

  describe 'POST #run_code' do
    it "should save params[:code] to a local file" do
      pending
    end

    it "should upload the local file to the remote server" do
      pending
    end

    it "should post the code result to Pusher" do
      pending
    end
  end
end
