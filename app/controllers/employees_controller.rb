class EmployeesController < ApplicationController

  def index
  end

  def show
    @employee = current_user
  end

  def edit
    @employee = current_user    
  end

  def update
  end

  def destroy
    @employee = current_user
    @employee.destroy
    reset_session
    redirect_to :root
  end

  def new
    @employee = Employee.new
  end

  def create
    if current_user
      @employee = current_user.company.employees.build(params[:employee])
      if @employee.save
        redirect_to company_path(current_user.company)
      else
        render :new
      end
    else
      redirect_to :root
    end
  end

end
