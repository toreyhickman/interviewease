require 'spec_helper'

describe InterviewsController, :type => :controller do
  before do
    @company = Company.create(name: "test")
    @employee = @company.employees.create(name: "test", email: "test", password: "test")

    @candidate = @company.candidates.create(name: "test")
    @interview = @employee.interviews.create(candidate_id: @candidate.id)

    @unauth_company = Company.create(name: "test3")
    @unauth_employee = @company.employees.create(name: "test3", email: "test3", password: "test3")
  end

  describe 'GET #show' do
    describe 'with a valid identifier' do
      it 'assigns the requested interview to @interview' do
        get :show, id: @interview.identifier
        assigns(:interview).should eq @interview
      end

      it 'renders the :show view' do
        get :show, id: @interview.identifier
        response.should render_template :show
      end
    end

    describe 'with an invalid identifier' do
      it 'redirects to home page' do
        get :show, id: 'INVALID-ID'
        response.should redirect_to root_url
      end
    end
  end

  describe 'PUT #update' do
    it 'assigns the requested interview to @interview' do
      put :update, id: @interview.identifier, complete: true
      assigns(:interview).should eq @interview
    end

    describe 'when authorized' do
      before do
        session[:user_id] = @employee.id
      end

      describe 'with valid attributes' do
        # Controller needs refactoring before testing!
        
        # it 'saves the updated interview to the database' do
        #   put :update, id: @interview.identifier, complete: true
        #   @interview.reload
        #   @interview.complete.should eq true
        # end

        it 'redirects to the interview feedback' do
          put :update, id: @interview.identifier, complete: true
          response.should redirect_to new_interview_feedback_path(@interview)
        end
      end

      describe 'with invalid attributes' do
        it 'doesnt save the updated interview to the database' do
          put :update, id: @interview.identifier, complete: "true"
          @interview.reload
          @interview.complete.should eq false
        end

        it 'redirects to the home page' do
          put :update, id: @interview.identifier, complete: "true"
          response.should redirect_to new_interview_feedback_path(@interview) # This needs fixing
        end
      end

      after do
        session[:user_id] = nil
      end
    end

    # create action need refactoring before testing for auth

    # describe 'when unauthorized' do
    #   before do
    #     session[:user_id] = @unauth_employee.id
    #   end

    #   it 'doesnt save the updated interview to the database' do
    #     put :update, id: @interview.identifier, complete: true
    #     @interview.reload
    #     @interview.complete.should eq false
    #   end

    #   it 'redirects to the home page' do
    #     put :update, id: @interview.identifier, complete: true
    #     response.should redirect_to root_url
    #   end

    #   after do
    #     session[:user_id] = nil
    #   end
    # end

    # describe 'when unauthenticated' do
    #   it 'doesnt save the updated interview to the database' do
    #     put :update, id: @interview.identifier, complete: true
    #     @interview.reload
    #     @interview.complete.should eq false
    #   end

    #   it 'redirects to the sign in page' do
    #     put :update, id: @interview.identifier, complete: true
    #     response.should redirect_to new_session_path
    #   end
    # end
  end
end
