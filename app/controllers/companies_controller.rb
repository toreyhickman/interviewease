class CompaniesController < ApplicationController
  before_filter :redirect_if_unauthenticated, only: :show
  before_filter :redirect_if_unauthorized, only: :show

  def show
    @company = current_user.company
  end

  def create
    if params[:name].empty?
      flash[:error] = "Company name must not be blank."
      redirect_to root_path and return
    end
    if params[:employee][:name].empty? || params[:employee][:email].empty? || params[:employee][:password].empty?
      flash[:error] = "Employee fields must not be blank."
      redirect_to root_path and return
    end
    @company = Company.new(name: params[:name])
    @employee = @company.employees.build(params[:employee])
    begin
      Company.transaction do
        @company.save
        @employee.save
      end
      session[:user_id] = @employee.id
      redirect_to @company
    rescue ActiveRecord::RecordInvalid
      redirect_to root_url
    end
  end

  private
    def redirect_if_unauthorized
      redirect_to root_url if !current_user || Company.find(params[:id]) != current_user.company
    end
end
