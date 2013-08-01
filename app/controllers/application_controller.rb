class ApplicationController < ActionController::Base
  protect_from_forgery

  helper_method :current_user, :login # Why is login a helper method???

  def current_user
    Employee.find_by_id(session[:user_id])
  end

  def scheduling_helper(interviewee)
    current_user.interviewees << interviewee
    # Move this to CandidatesController??
  end

  def redirect_if_unauthenticated
    redirect_to new_session_path if !current_user
  end

end
