require 'spec_helper'
require 'faker'

describe ChallengesController, :type => :controller do
  before do
    @company = Company.create!(name: Faker::Name.name)

    @employee = @company.employees.create!(
                name: Faker::Name.name,
                email: Faker::Internet.email,
                password: "password")

    @challenge = @company.challenges.create!(
                 title: Faker::Name.name,
                 description: Faker::Lorem.paragraph,
                 code: Faker::Lorem.paragraph,
                 test_code: Faker::Lorem.paragraph)

    @unauthorized_company = Company.create!(name: Faker::Name.name)

    @unauthorized_employee = @unauthorized_company.employees.create!(
                             name: Faker::Name.name,
                             email: Faker::Internet.email,
                             password: "password")
  end

  describe "when authorized" do
    before do
      session[:user_id] = @employee.id
    end
    
    describe 'GET #show' do
      it "assigns the requested challenge to challenge" do
        get :show, id: @challenge.id
        assigns(:challenge).should eq @challenge
      end

      it "renders the #show view" do
        get :show, id: @challenge.id
        response.should render_template :show
      end
    end

    describe 'GET #new' do
      it "assigns a new challenge object to challenge" do
        get :new
        assigns(:challenge).is_a? Challenge
      end

      it "renders the #new view" do
        get :new
        response.should render_template :new
      end
    end

    describe 'POST #create' do
      context "with valid attributes" do
        it "saves the challenge to the database" do
          expect { post :create, { challenge: { title: "One Plus Two",
                                 description: "Add one plus two",
                                 code: "1 + 2",
                                 test_code: "one_plus_two == 3" } }
          }.to change{ Challenge.count }.by(1)
        end

        it "redirects to created challenge" do
          post :create, { challenge: { title: "One Plus Two",
                                 description: "Add one plus two",
                                 code: "1 + 2",
                                 test_code: "one_plus_two == 3" } }
          response.should redirect_to Challenge.last
        end
      end

      context "with invalid attributes" do
        it "does not save the challenge to the database" do
          expect { post :create, { challenge: { title: "Missing attrs",
                                 description: "",
                                 code: "",
                                 test_code: "" } }
            }.not_to change { Challenge.count }
        end

        it "re-renders the #new partial" do
          expect { post :create, { challenge: { title: "Missing attrs",
                                 description: "",
                                 code: "",
                                 test_code: "" } }
            }.to render_template :new
        end
      end
    end

    describe 'GET #edit' do
      it "assigns the requested challenge to challenge" do
        get :edit, id: @challenge.id
        assigns(:challenge).should eq @challenge
      end

      it "renders the #edit view" do
        get :edit, id: @challenge.id
        response.should render_template 'edit'
      end
    end

    describe 'PUT #update' do
      context "with valid attributes" do
        it "saves the updated challenge to the database" do
          post :update, { id: @challenge.id,
                        challenge: { title: "One Plus One",
                                     description: "Add one plus one",
                                     code: "1 + 1",
                                     test_code: "one_plus_one.should eq 2" } }
          @challenge.reload
          @challenge.test_code.should eq "one_plus_one.should eq 2"
        end

        it "redirects to the updated challenge" do
          post :update, { id: @challenge.id,
                        challenge: { title: "One Plus One",
                                     description: "Add one plus one",
                                     code: "1 + 1",
                                     test_code: "one_plus_one.should eq 2" } }
          response.should redirect_to @challenge
        end
      end

      context "with invalid attributes" do
        it "does not save the changes to the database" do
          post :update, id: @challenge.id, title: ""
          @challenge.reload
          @challenge.test_code.should_not eq ""
        end

        it "re-renders the #edit view" do
          post :update, id: @challenge.id, title: ""
          response.should render_template 'edit'
        end
      end
    end

    describe 'DELETE #destroy' do
      it "deletes the challenge from the database" do
        expect { delete :destroy, id: @challenge.id
        }.to change { Challenge.count }.by(-1)
      end

      it "should redirect to company page" do
        delete :destroy, id: @challenge.id
        response.should redirect_to company_path(@company)
      end
    end

    after do
      session[:user_id] = nil
    end
  end

  describe "when not authorized" do
    before do
      session[:user_id] = @unauthorized_employee.id
    end

    describe 'GET #show' do
      it "does not assign the requested challenge to challenge" do
        get :show, id: @challenge.id
        assigns(:challenge).should be_nil
      end

      it "should redirect to home page" do
        get :show, id: @challenge.id
        response.should redirect_to root_url
      end  
    end

    describe 'GET #edit' do
      it "assigns the requested challenge to challenge" do
        get :edit, id: @challenge.id
        assigns(:challenge).should be_nil
      end

      it "should redirect to home page" do
        get :edit, id: @challenge.id
        response.should redirect_to root_url
      end
    end

    describe 'PUT #update' do
      it "does not save the updated challenge to the database" do
        post :update, id: @challenge.id,
                      title: "One Plus One",
                      description: "Add one plus one",
                      code: "1 + 1",
                      test_code: "one_plus_one.should eq 2"
        @challenge.reload
        @challenge.test_code.should_not eq "one_plus_one.should eq 2"
      end

      it "should redirect to home page" do
        post :update, id: @challenge.id,
                      title: "One Plus One",
                      description: "Add one plus one",
                      code: "1 + 1",
                      test_code: "one_plus_one.should eq 2"
        response.should redirect_to root_url
      end
    end

    describe 'DELETE #destroy' do
      it "does not delete the challenge from the database" do
        expect { delete :destroy, id: @challenge.id
        }.not_to change { Challenge.count }
      end

      it "should redirect to home page" do
        delete :destroy, id: @challenge.id
        response.should redirect_to root_url
      end
    end

    after do
      session[:user_id] = nil
    end
  end

  describe "when not authenticated" do
    before do
      session[:user_id] = nil
    end

    describe 'GET #show' do
      it "does not assign the requested challenge to challenge" do
        get :show, id: @challenge.id
        assigns(:challenge).should be_nil
      end

      it "should redirect to home page" do
        get :show, id: @challenge.id
        response.should redirect_to root_url
      end  
    end

    describe 'GET #new' do
      it "does not assign a new challenge object to challenge" do
        get :new
        assigns(:challenge).should be_nil
      end

      it "should redirect to log in page" do
        get :new
        response.should redirect_to new_session_path
      end
    end

    describe 'POST #create' do
      it "doesn't save the challenge to the database" do
        expect { post :create, { challenge: {title: "One Plus Two",
                               description: "Add one plus two",
                               code: "1 + 2",
                               test_code: "one_plus_two == 3" } }
        }.not_to change { Challenge.count }
      end

      it "should redirect to log in page" do
        post :create, { challenge: {title: "One Plus Two",
                               description: "Add one plus two",
                               code: "1 + 2",
                               test_code: "one_plus_two == 3" } }
        response.should redirect_to new_session_path
      end
    end

    describe 'GET #edit' do
      it "assigns the requested challenge to challenge" do
        get :edit, id: @challenge.id
        assigns(:challenge).should be_nil
      end

      it "should redirect to home page" do
        get :edit, id: @challenge.id
        response.should redirect_to root_url
      end
    end

    describe 'PUT #update' do
      it "does not save the updated challenge to the database" do
        post :update, id: @challenge.id,
                      title: "One Plus One",
                      description: "Add one plus one",
                      code: "1 + 1",
                      test_code: "one_plus_one.should eq 2"
        @challenge.reload
        @challenge.test_code.should_not eq "one_plus_one.should eq 2"
      end

      it "should redirect to home page" do
        post :update, id: @challenge.id,
                      title: "One Plus One",
                      description: "Add one plus one",
                      code: "1 + 1",
                      test_code: "one_plus_one.should eq 2"
        response.should redirect_to root_url
      end
    end

    describe 'DELETE #destroy' do
      it "shouldn't delete the challenge from the database" do
        expect { delete :destroy, id: @challenge.id
        }.not_to change { Challenge.count }
      end

      it "should redirect to home page" do
        delete :destroy, id: @challenge.id
        response.should redirect_to root_url
      end
    end
  end
end
