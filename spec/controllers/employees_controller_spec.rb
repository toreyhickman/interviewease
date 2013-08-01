require 'spec_helper'

describe EmployeesController, :type => :controller do
  before do
    @company = Company.create(name: "test")
    @employee = @company.employees.create(name: "test", email: "test", password: "test")

    @candidate = @company.candidates.create(name: "test")
    @interview = @employee.interviews.create(candidate_id: @candidate.id)

    @unauth_company = Company.create(name: "test3")
    @unauth_employee = @company.employees.create(name: "test3", email: "test3", password: "test3")
  end

  describe 'with authorization' do
    before do
      session[:user_id] = @employee.id
    end

    describe 'GET #show' do
      it 'assigns current_user to @employee' do
        get :show, id: @employee.id
        assigns(:employee).should eq @employee
      end

      it 'assigns the current users upcoming interviews to @interviews' do
        get :show, id: @employee.id
        assigns(:interviews).should eq [@interview]
      end

      it 'should render the :show view' do
        get :show, id: @employee.id
        response.should render_template :show
      end
    end

    describe 'GET #new' do
      it 'assigns a new employee to @employee' do
        get :new
        assigns(:employee).is_a? Employee
        assigns(:employee).id.should eq nil
      end

      it 'should render the :new view' do
        get :new
        response.should render_template :new
      end
    end

    describe 'POST #create' do
      describe 'with valid attributes' do
        it 'should save the employee to the database' do
          expect { post :create, { employee: { name: "test2", email: "test2", password: "test2" } }
            }.to change { Employee.count }.by(1)
        end

        it 'should redirect to the company page' do
          post :create, { employee: { name: "test2", email: "test2", password: "test2" } }
          response.should redirect_to company_path(@company)
        end
      end

      describe 'with invalid attributes' do
        it 'shouldnt save the employee to the database' do
          expect { post :create, { employee: { name: "", email: "", password: "" } }
            }.not_to change { Employee.count }
        end

        it 'should re-render the :new partial' do
          post :create, { employee: { name: "", email: "", password: "" } }
          response.should render_template :new
        end
      end
    end

    describe 'GET #edit' do
      it 'assigns the current_user to @employee' do
        get :edit, id: @employee.id
        assigns(:employee).should eq @employee
      end

      it 'renders the :edit view' do
        get :edit, id: @employee.id
        response.should render_template :edit
      end
    end

    describe 'PUT #update' do
      describe 'with valid attributes' do
        it 'should save the updates to the database' do
          put :update, { id: @employee.id, employee: { name: "changed_name", email: "changed@email.com", password: "changed_password" } }
          @employee.reload
          @employee.name.should eq "changed_name"
          @employee.email.should eq "changed@email.com"
        end

        it 'should redirect to the employee page' do
          put :update, { id: @employee.id, employee: { name: "changed_name", email: "changed@email.com", password: "changed_password" } }
          response.should redirect_to @employee
        end
      end

      describe 'with invalid attributes' do
        it 'shouldnt save the updates to the database' do
          put :update, { id: @employee.id, employee: { name: "", email: "", password: "" } }
          @employee.reload
          @employee.name.should_not eq "changed_name"
          @employee.email.should_not eq "changed@email.com"
          @employee.password.should_not eq "changed_password"
        end

        it 'should re-render the :edit form' do
          put :update, { id: @employee.id, employee: { name: "", email: "", password: "" } }
          response.should render_template :edit
        end
      end
    end

    describe 'DELETE #destroy' do
      it 'should delete the employee from the database' do
        expect { delete :destroy, id: @employee.id
          }.to change { Employee.count }.by(-1)
      end

      it 'should clear the session' do
        delete :destroy, id: @employee.id
        session[:user_id].should be nil
      end

      it 'should redirect to the root url' do
        delete :destroy, id: @employee.id
        response.should redirect_to root_url
      end
    end

    after do
      session[:user_id] = nil
    end
  end

  describe 'without authorization' do
    before do
      session[:user_id] = @unauth_employee.id
    end

    describe 'GET #show' do
      it 'does not assign current_user to @employee' do
        get :show, id: @employee.id
        assigns(:employee).should_not eq @employee
      end

      it 'does not assign the users upcoming interviews to @interviews' do
        get :show, id: @employee.id
        assigns(:interviews).should_not eq [@interview]
      end

      it 'redirects to root url' do
        get :show, id: @employee.id
        response.should redirect_to root_url
      end
    end

    describe 'GET #edit' do
      it 'does not assign the current_user to @employee' do
        get :edit, id: @employee.id
        assigns(:employee).should_not eq @employee
      end

      it 'redirect to home page' do
        get :edit, id: @employee.id
        response.should redirect_to root_url
      end
    end

    describe 'PUT #update' do
      it 'shouldnt save the updates to the database' do
        put :update, { id: @employee.id, employee: { name: "changed_name", email: "changed@email.com", password: "changed_password" } }
        @employee.reload
        @employee.name.should_not eq "changed_name"
        @employee.email.should_not eq "changed@email.com"
      end

      it 'redirects to root url' do
        put :update, { id: @employee.id, employee: { name: "changed_name", email: "changed@email.com", password: "changed_password" } }
        response.should redirect_to root_url
      end
    end

    describe 'DELETE #destroy' do
      it 'should not delete the employee from the database' do
        expect { delete :destroy, id: @employee.id
          }.not_to change { Employee.count }
      end

      it 'redirects to the root url' do
        delete :destroy, id: @employee.id
        response.should redirect_to root_url
      end
    end

    after do
      session[:user_id] = nil
    end
  end

  describe 'without authentication' do
    describe 'GET #show' do
      it 'redirects to sign in page' do
        get :show, id: @employee.id
        response.should redirect_to new_session_path
      end
    end

    describe 'GET #edit' do
      it 'redirects to sign in page' do
        get :edit, id: @employee.id
        response.should redirect_to new_session_path
      end
    end

    describe 'PUT #update' do
      it 'shouldnt save the updates to the database' do
        put :update, { id: @employee.id, employee: { name: "changed_name", email: "changed@email.com", password: "changed_password" } }
        @employee.reload
        @employee.name.should_not eq "changed_name"
        @employee.email.should_not eq "changed@email.com"
      end

      it 'redirects to sign in page' do
        put :update, { id: @employee.id, employee: { name: "changed_name", email: "changed@email.com", password: "changed_password" } }
        response.should redirect_to new_session_path
      end
    end

    describe 'DELETE #destroy' do
      it 'should not delete the employee from the database' do
        expect { delete :destroy, id: @employee.id
          }.not_to change { Employee.count }
      end

      it 'redirects to sign in page' do
        delete :destroy, id: @employee.id
        response.should redirect_to new_session_path
      end
    end
  end
end
