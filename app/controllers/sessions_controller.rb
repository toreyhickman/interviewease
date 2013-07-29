class SessionsController < ApplicationController
  def create_company
    @company = Company.create(params[:company])
  end

  def new
    @company = Company.new
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
