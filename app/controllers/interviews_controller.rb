class InterviewsController < ApplicationController

  def show
    if Interview.find_by_identifier(params[:id])
      @interview = Interview.find_by_identifier(params[:id])
    else
      redirect_to root_url
    end
  end

  def update
    @interview = Interview.find_by_identifier(params[:id])
    if @interview.update_attributes(params[:interview])
      redirect_to new_interview_feedback_path(@interview)
    else
      flash[:notice] = "Something went wrong with saving the interview as complete."
      redirect_to current_user # Somewhere better to redirect?
    end
  end

  # This code shouldn't just select last record. Not sure where being used so will fix with testing

  # def new_interview_feedack
  #   @interview = Interview.last
  # end
end
