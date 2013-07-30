class ApplicationController < ActionController::Base
  protect_from_forgery

  # Application helper methods
  helper_method :current_user, :login


  def current_user
    Employee.find_by_id(session[:user_id])
  end

  def scheduling_helper(interviewee)
    current_user.interviewees << interviewee
  end

end
