class CheckinsController < ApplicationController

  def create
    if Interview.find_by_identifier(params[:identifier])
      redirect_to interview_path(params[:identifier])
    else
      flash[:error] = "Couldn't find a interview for that key!"
      redirect_to root_url
    end
  end

end
