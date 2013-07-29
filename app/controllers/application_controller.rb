class ApplicationController < ActionController::Base
  protect_from_forgery

  # Application helper methods
  helper_method :current_user, :login

  def login
    @employee = Employee.find_by_email(params[:email])
    if @employee && @employee.password == params[:password]
      session[:user_id] = @employee.id
      render "show"
    else
      render "index"
    end
  end

  def current_user
    Employee.find_by_id(session[:user_id])
  end

end
