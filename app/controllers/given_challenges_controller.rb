class GivenChallengesController < ApplicationController

  def create
    respond_to do |format|

      @challenge = Challenge.find(params[:challenge_id])
      
      given_challenge = GivenChallenge.new
      given_challenge.challenge_id = @challenge.id
      given_challenge.candidate_id = params[:candidate_id]
      given_challenge.interview_id = params[:interview_id]
      given_challenge.save

      format.json do
        render :json => { :challenge => @challenge }
      end
    end
  end

end
