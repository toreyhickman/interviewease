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
      redirect_to current_user
    else
      flash[:notice] = "Something went wrong with saving the interview as complete."
      redirect_to current_user
    end
  end

  # def mark_complete

  #   respond_to do |format|
  #     format.json do
      
  #       interview = Interview.find(params[:interview_id])
  #       interview.complete = true
  #       interview.save

  #       render :json => { :url => employee_url(current_user) }

  #     end
  #   end
  # end
end
