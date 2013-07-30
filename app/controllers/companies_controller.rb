class CompaniesController < ApplicationController
  before_filter :redirect_if_unauthenticated, only: :show
  before_filter :redirect_if_unauthorized, only: :show

  def show
    @company = current_user.company
  end

  def create
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
