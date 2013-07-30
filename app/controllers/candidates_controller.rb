class CandidatesController < ApplicationController

  def create
    if current_user.company.candidates.find_by_name(params[:candidate][:name])
      interviewee = Candidate.find_by_name(params[:candidate][:name])
    else
      interviewee = Candidate.new(name: params[:candidate][:name], email: params[:candidate][:email])
      current_user.company.candidates << interviewee
    end

    if interviewee.id
      scheduling_helper(interviewee)
      redirect_to current_user
    else
      flash[:error] = "Couldn't schedule the interview."
      redirect_to current_user
    end
  end
end
