class ChallengesController < ApplicationController

   def index
  end

  def show
    @challenge = Challenge.find(params[:id])
  end

  def edit
    @challenge = Challenge.find(params[:id])    
  end

  def update
  end

  def destroy
    @challenge = Challenge.find(params[:id])
    @challenge.destroy
  end

  def new
  end

  def create
  end

end