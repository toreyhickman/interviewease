class ChallengesController < ApplicationController

  def index
  end

  def show
    @challenge = current_user.company.challenges.find(params[:id])
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

  def new
    @company = Company.find(current_user.company.id)
    @challenge = Challenge.new
  end

  def create
    @challenge = Challenge.new(params[:challenge])
    @challenge.author = current_user
    current_user.company.challenges << @challenge
  end

end
