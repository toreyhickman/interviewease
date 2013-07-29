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
  end

  def create
  end

end