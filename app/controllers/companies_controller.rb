class CompaniesController < ApplicationController

  def signup
    @company = Company.create(name: params[:name])
    render "show"
  end

  def show
    @company = Company.find(params[:id])
  end

  def index
    @companies = Company.all
  end

end