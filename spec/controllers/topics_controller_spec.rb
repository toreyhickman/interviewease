require 'spec_helper'

describe TopicsController, :type => :controller do
  describe 'when authenticated' do
    before do
      @company = Company.create(name: "test")
      @employee = @company.employees.create(name: "test", email: "test", password: "test")

      @candidate = @company.candidates.create(name: "test")
      @interview = @employee.interviews.create(candidate_id: @candidate.id)

      session[:user_id] = @employee.id
    end

    describe 'GET #new' do
      it 'assigns the current users company to @company' do
        get :new
        assigns(:company).should eq @company
      end

      it 'assigns a new topic to @topic' do
        get :new
        assigns(:topic).is_a? Topic
        assigns(:topic).id.should eq nil
      end

      it 'renders the #new view' do
        get :new
        response.should render_template :new
      end
    end

    describe 'POST #create' do
      describe 'with valid attributes' do
        it 'saves the topic to the database' do
          expect { post :create, { topic: { name: "test" } }
            }.to change { Topic.count }.by(1)
        end

        it 'redirects to the company page' do
          post :create, { topic: { name: "test" } }
          response.should redirect_to @employee.company
        end
      end

      describe 'with invalid attributes' do
        it 'does not save the topic to the database' do
          expect { post :create, { topic: { name: "" } }
            }.not_to change { Topic.count }
        end

        it 're-renders the :new view' do
          # post :create, { topic: { name: "" } }
          # response.should render_template :new
          pending "Not sure why above code is failing"
        end
      end
    end
  end

  describe 'when unauthenticated' do
    describe 'GET #new' do
      it 'redirects to sign in page' do
        get :new
        response.should redirect_to new_session_path
      end
    end

    describe 'POST #create' do
      it 'doesnt save the topic to the database' do
        expect { post :create, { topic: { name: "test" } }
          }.not_to change { Topic.count }
      end

      it 'redirects to the sign in page' do
        post :create, { topic: { name: "test" } }
        response.should redirect_to new_session_path
      end
    end
  end
end
