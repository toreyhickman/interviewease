class EmployeesController < ApplicationController

  def show
    @employee = current_user
    @interviews = current_user.interviews.includes(:candidate).where("complete = false")
  end

  def new
    @employee = Employee.new
  end

  def create # Something is wrong here. Will fix - Andrew.
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

  def edit
    @employee = current_user    
  end

  def update
    @employee = current_user
    if @employee.update_attributes(params[:employee])
      redirect_to @employee
    else
      render :edit
    end
  end

  def destroy
    @employee = current_user
    @employee.destroy
    reset_session
    redirect_to :root
  end

end
