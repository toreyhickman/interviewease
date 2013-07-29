class EmployeesController < ApplicationController

  def index
  end

  def show
    @employee = Employee.find(params[:id])
  end

  def edit
    @employee = Employee.find(params[:id])    
  end

  def update
  end

  def destroy
    @employee = Employee.find(params[:id])
    @employee.destroy
  end

  def new
    @employee = Employee.new
  end

  def create
    @employee = Employee.create(params[:employee])
    @current_employee = Employee.find(session[:user_id])
    @current_company = @current_employee.company.id
    @company = Company.find(@current_company)
    @company.employees << @employee
  end

end