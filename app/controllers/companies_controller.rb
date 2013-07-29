class CompaniesController < ApplicationController

  def signup
    @company = Company.new(name: params[:name])
    if @company.save
      redirect_to
    else
      # after a successful create, always redirect. if error then render the form again
      render "show"
    end
  end

  def show
    @company = Company.find(params[:id])
  end

  def index
    @companies = Company.all
  end

end