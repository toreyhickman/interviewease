class ChallengesController < ApplicationController

   def index
  end

  def show
    @challenge = Challenge.find(params[:id])
  end

  def edit
    @challenge = Challenge.find(params[:id])    
  end

  def update
  end

  def destroy
    @challenge = Challenge.find(params[:id])
    @challenge.destroy
  end

  def new
    employee = Employee.find(session[:user_id])
    @company = Company.find(employee.company.id)
    @challenge = Challenge.new
  end

  def create
    @challenge = Challenge.create(params[:challenge])
  end

end