class ApplicationController < ActionController::Base
  protect_from_forgery

  # Application helper methods
  helper_method :current_user, :login

  def logout
     session[:user_id] = nil
     redirect_to root_url
   end

  def current_user
    Employee.find_by_id(session[:user_id])
  end

end
