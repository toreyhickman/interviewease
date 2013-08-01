require 'spec_helper'

describe EmployeesController, :type => :controller do

  describe 'when authorization' do
    describe 'GET #show' do
      it 'assigns current_user to @employee' do
        pending
      end

      it 'assigns the current users upcoming interviews to @interviews' do
        pending
      end

      it 'should render the :show view' do
        pending
      end
    end

    describe 'GET #new' do
      it 'assigns a new employee to @employee' do
        pending
      end

      it 'should render the :new view' do
        pending
      end
    end

    describe 'POST #create' do
      describe 'with valid attributes' do
        it 'should save the employee to the database' do
          pending
        end

        it 'should redirect to the company page' do
          pending
        end
      end

      describe 'with invalid attributes' do
        it 'shouldnt save the employee to the database' do
          pending
        end

        it 'should re-render the :new partial' do
          pending
        end
      end
    end

    describe 'GET #edit' do
      it 'assigns the current_user to @employee' do
        pending
      end

      it 'renders the :edit view' do
        pending
      end
    end

    describe 'PUT #update' do
      describe 'with valid attributes' do
        it 'should save the updates to the database' do
          pending
        end

        it 'should redirect to the employee page' do
          pending
        end
      end

      describe 'with invalid attributes' do
        it 'shouldnt save the updates to the database' do
          pending
        end

        it 'should re-render the :edit form' do
          pending
        end
      end
    end

    describe 'DELETE #destroy' do
      it 'should delete the employee from the database' do
        pending
      end

      it 'should clear the session' do
        pending
      end

      it 'should redirect to the root url' do
        pending
      end
    end
  end

  describe 'without authorization' do
    describe 'GET #show' do
      it 'does not assign current_user to @employee' do
        pending
      end

      it 'does not assign the current users upcoming interviews to @interviews' do
        pending
      end

      it 'redirects to root url' do
        pending
      end
    end

    describe 'GET #edit' do
      it 'does not assign the current_user to @employee' do
        pending
      end

      it 'redirect to home page' do
        pending
      end
    end

    describe 'PUT #update' do
      it 'shouldnt save the updates to the database' do
        pending
      end

      it 'redirects to root url' do
        pending
      end
    end

    describe 'DELETE #destroy' do
      it 'should not delete the employee from the database' do
        pending
      end

      it 'should not clear the session' do
        pending
      end

      it 'redirects to the root url' do
        pending
      end
    end
  end

  describe 'without authentication' do
    describe 'GET #show' do
      it 'redirects to sign in page' do
        pending
      end
    end

    describe 'GET #show' do
      it 'redirects to sign in page' do
        pending
      end
    end

    describe 'GET #edit' do
      it 'redirects to sign in page' do
        pending
      end
    end

    describe 'PUT #update' do
      it 'shouldnt save the updates to the database' do
        pending
      end

      it 'redirects to sign in page' do
        pending
      end
    end

    describe 'DELETE #destroy' do
      it 'should not delete the employee from the database' do
        pending
      end

      it 'redirects to sign in page' do
        pending
      end
    end
  end
end
