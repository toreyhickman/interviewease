class SessionsController < ApplicationController
  def create_company # This shouldn't be in the sessions controller
    @company = Company.create(params[:company])
  end

  def new
    if current_user
      redirect_to current_user
    else
      @company = Company.new
      render :layout => 'landing'
    end
  end

  def create
    @employee = Employee.find_by_email(params[:email])
    if @employee && @employee.password == params[:password]
      session[:user_id] = @employee.id
      redirect_to employee_path(current_user)
    else
      redirect_to root_url
    end
  end

  def destroy
   reset_session
   redirect_to root_url
 end

end
