class CompaniesController < ApplicationController

  def create
    @company = Company.new(name: params[:name])
    @employee = Employee.new(params[:employee])
    if @company.valid? && @employee.valid?
      @company.save
      @company.employees << @employee
      session[:user_id] = @employee.id
      redirect_to @company
    else
      redirect_to new_session_path
    end
  end

  def show
    if current_user
      @company = current_user.company
    else
      redirect_to :root
    end
  end
end
