class InterviewsController < ApplicationController

  def find_interview
    Interview.find_by_identifier(params[:id])
  end

  def create
  end

  def show
    @interview = find_interview
  end

  def update
    @interview = find_interview
    if @interview.update_attributes(params[:interview])
      redirect_to new_interview_feedback_path(@interview)
    else
      flash[:notice] = "Something went wrong with saving the interview as complete."
      redirect_to current_user
    end
  end

  def new_interview_feedack
    @interview = Interview.last
  end

end
