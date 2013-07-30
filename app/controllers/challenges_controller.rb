class ChallengesController < ApplicationController
  before_filter :redirect_if_unauthenticated, only: [:new, :create]
  before_filter :redirect_if_unauthorized, except: [:new, :create]

  def show
    @challenge = current_user.company.challenges.find(params[:id])
  end

  def new
    @challenge = Challenge.new
  end

  def create
    @challenge = current_user.company.challenges.new(params[:challenge])
    if @challenge.save
      redirect_to @challenge
    else
      render :new
    end
  end

  def edit
    @challenge = current_user.company.challenges.find(params[:id])
  end

  def update
    @challenge = current_user.company.challenges.find(params[:id])
    if @challenge.update_attributes(params[:challenge])
      redirect_to @challenge
    else
      render :edit
    end
  end

  def destroy
    challenge = current_user.company.challenges.find(params[:id])
    challenge.destroy
    redirect_to company_path(challenge.company)
  end

  private

    def redirect_if_unauthenticated
      redirect_to new_session_path if !current_user
    end
  
    def redirect_if_unauthorized
      redirect_to root_url if !current_user || Challenge.find(params[:id]).company != current_user.company
    end
end
