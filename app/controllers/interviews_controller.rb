class InterviewsController < ApplicationController

  def create
  end

  def show
    @interview = Interview.find_by_identifier(params[:id])
  end

  def mark_complete

    respond_to do |format|
      format.json do
      
        interview = Interview.find(params[:interview_id])
        interview.complete = true
        interview.save

        render :json => { :url => employee_url(current_user) }

      end
    end
  end
end
