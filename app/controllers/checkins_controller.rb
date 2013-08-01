class CheckinsController < ApplicationController

  def create
    if Interview.find_by_identifier(params[:identifier])
      redirect_to interview_path(params[:identifier])
    else

      flash[:error] = "No interviews match that code"
      render "sessions/new", layout: 'landing'
      
    end
  end

end
