require 'spec_helper'

describe ApplicationController, :type => :controller do

  describe '#current_user method' do
    describe 'when authenticated' do
      # it 'returns the signed in user' do
      #   @company = Company.create(name: "test")
      #   @employee = @company.employees.create(name: "test", email: "test", password: "test")
      #   session[:user_id] = @employee.id

      #   ApplicationController.current_user.should eq @employee
      # end
      pending "Not sure how to implement"
    end

    describe 'when unauthenticated' do
      # it 'returns nill' do
      #   ApplicationController.new.current_user.should eq nil
      # end
      pending "Not sure how to implement"
    end
  end

  describe '#scheduling_helper method' do
    pending "Perhaps unnecessary"
  end

  describe '#redirect_if_unauthenticated method' do
    describe 'when authenticated' do
      # it 'returns the signed in user' do
      #   @company = Company.create(name: "test")
      #   @employee = @company.employees.create(name: "test", email: "test", password: "test")
      #   session[:user_id] = @employee.id

      #   ApplicationController.redirect_if_unauthenticated
      #   response.should_not redirect_to new_session_path
      # end
      pending "Not sure how to implement"
    end

    describe 'when unauthenticated' do
      # it 'returns nill' do
      #   @controller = ApplicationController.new
      #   ApplicationController.redirect_if_unauthenticated
      #   response.should redirect_to new_session_path
      # end
      pending "Not sure how to implement"
    end
  end
end
