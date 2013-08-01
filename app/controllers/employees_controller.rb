class EmployeesController < ApplicationController
  before_filter :redirect_if_unauthenticated
  before_filter :redirect_if_unauthorized, except: [:new, :create]

  def show
    @employee = Employee.find(params[:id])
    @interviews = @employee.interviews.includes(:candidate).where("complete = false")
  end

  def new
    @employee = Employee.new
  end

  def create
    @employee = current_user.company.employees.build(params[:employee])
    if @employee.save
      redirect_to company_path(current_user.company)
    else
      render :new
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

  private
    def redirect_if_unauthorized
      redirect_to root_url if !current_user || Employee.find(params[:id]) != current_user
    end
end
