class InterviewsController < ApplicationController

  def show
    @interview = Interview.find_by_identifier(params[:identifier])
  end

end
