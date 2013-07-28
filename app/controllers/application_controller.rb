class ApplicationController < ActionController::Base
  protect_from_forgery

  # Application helper methods
  helper_method :current_user, :login

  def login
    @user = User.find_by_email(params[:email])
    if @user.password == params[:password]
      session[:user_id] = @user.id
    else
      @user.errors.full_messages
    end
  end

  def current_user
    User.find_by_id(session[:user_id])
  end

end
