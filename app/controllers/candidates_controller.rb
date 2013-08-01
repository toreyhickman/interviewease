class CandidatesController < ApplicationController
  before_filter :redirect_if_unauthenticated

  def create
    @candidate = current_user.company.candidates.find_or_create_by_name(params[:candidate][:name])
    @candidate.email = params[:candidate][:email]
    if @candidate.save
      scheduling_helper(@candidate)
      redirect_to current_user
    else
      flash[:error] = "Couldn't schedule the interview."
      redirect_to current_user
    end
  end
end
