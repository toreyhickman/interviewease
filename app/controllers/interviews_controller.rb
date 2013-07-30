class InterviewsController < ApplicationController

  def create
  end

  def show
    @interview = Interview.find_by_identifier(params[:identifier])
  end
end
