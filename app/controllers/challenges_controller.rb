class ChallengesController < ApplicationController
  before_filter :challenge_owner?

  def show
    @challenge = current_user.company.challenges.find(params[:id])
  end

  def new
    @company = Company.find(current_user.company.id)
    @challenge = Challenge.new
  end

  def create
    @challenge = Challenge.new(params[:challenge])
    @challenge.author = current_user
    current_user.company.challenges << @challenge
  end

  def edit
    @challenge = current_user.company.challenges.find(params[:id])
  end

  def update
    @challenge = current_user.company.challenges.find(params[:id])
    @challenge.update_attributes(params[:challenge])
  end

  def destroy
    challenge = current_user.company.challenges.find(params[:id])
    challenge.destroy
  end

  private
    def challenge_owner?
      redirect_to root_url if !current_user || Challenge.find(params[:id]).company != current_user.company
    end
end
