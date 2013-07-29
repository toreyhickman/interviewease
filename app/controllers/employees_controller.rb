class EmployeesController < ApplicationController

  def index
  end

  def show
    # consider security
    @employee = Employee.find(params[:id])
  end

  def edit
    # consider security
    @employee = Employee.find(params[:id])    
  end

  def update
  end

  def destroy
    # consider security
    @employee = Employee.find(params[:id])
    @employee.destroy
  end

  def new
    @employee = Employee.new
  end

  def create
    @employee = current_user.company.employees.build(params[:employee])
    if @employee.save
      redirect_to
    else
      render :new
    end
  end

end