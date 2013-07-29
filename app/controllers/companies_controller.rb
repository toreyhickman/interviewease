class CompaniesController < ApplicationController

  def create
    @company = Company.create!(name: params[:name])
    @employee = Employee.create!(params[:employee])
    @company.employees << @employee
    session[:user_id] = @employee.id

    redirect_to @company
  end

  def show
    @company = Company.find(params[:id])
  end

  def index
    @companies = Company.all
  end

end