require 'spec_helper'

describe ChallengesController, :type => :controller do
  before do
    @challenge = Challenge.create(title: "One Plus One", description: "Add one plus one", code: "1 + 1", test_code: "one_plus_one == 2")
  end

  describe "when authorized" do
    before do
      # MAKE SURE CORRECT USER IS SIGNED IN
    end
    
    describe 'GET #show' do
      it "assigns the requested challenge to @challenge" do
        get :show, id: @challenge.id
        assigns(:challenge).should eq @challenge
      end

      it "renders the #show view" do
        get :show
        response.should render_tempate :show
      end
    end

    describe 'GET #new' do
      it "assigns a new challenge object to @challenge" do
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
          expect { post :create, title: "One Plus Two",
                                 description: "Add one plus two",
                                 code: "1 + 2",
                                 test_code: "one_plus_two == 3"
          }.to change(Challenge.count).by(1)
        end

        it "redirects to ???" do
          expect { post :create, title: "One Plus Two",
                                 description: "Add one plus two",
                                 code: "1 + 2",
                                 test_code: "one_plus_two == 3"
          }.to redirect_to Challenge.last
        end
      end

      context "with invalid attributes" do
        it "does not save the challenge to the database" do
          expect { post :create, title: "Missing paramaters"
            }.not_to change(Challenge.count)
        end

        it "re-renders the #new partial" do
          expect { post :create, title: "Missing paramaters"
            }.to render_template :new
        end
      end
    end

    describe 'GET #edit' do
      it "assigns the requested challenge to @challenge" do
        get :edit, id: @challenge.id
        assigns(:challenge).should eq @challenge
      end

      it "renders the #edit view" do
        get :edit, id: @challenge.id
        response.should render_template :edit
      end
    end

    describe 'PUT #update' do
      context "with valid attributes" do
        it "saves the updated challenge to the database" do
          post :update, id: @challenge.id,
                        title: "One Plus One",
                        description: "Add one plus one",
                        code: "1 + 1",
                        test_code: "one_plus_one.should eq 2"
          @challenge.reload
          @challenge.test_code.should eq "one_plus_one.should eq 2"
        end

        it "redirects to the ??? view" do
          post :update, id: @challenge.id,
                        title: "One Plus One",
                        description: "Add one plus one",
                        code: "1 + 1",
                        test_code: "one_plus_one.should eq 2"
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
          response.should render_template :edit
        end
      end
    end

    describe 'DELETE #destroy' do
      it "deletes the challenge from the database" do
        expect { delete :destroy, id: @challenge
        }.to change(Challenge.count).by(1)
      end

      it "should redirect to ???" do
        delete :destroy, id: @challenge
        response.should redirect_to ???
      end
    end
  end

  describe "when not authorized" do
    before do
      # MAKE SURE INCORRECT USER IS SIGNED IN
    end

    describe 'GET #show' do
      it "does not assign the requested challenge to @challenge" do
        get :show, id: @challenge.id
        assigns(:challenge).should_not be_valid
      end

      it "should redirect to home page" do
        get :show
        response.should redirect_to root_url
      end  
    end

    describe 'GET #new' do
      it "does not assign a new challenge object to @challenge" do
        get :new
        assigns(:challenge).should_not be_valid
      end

      it "should redirect to home page" do
        get :new
        response.should redirect_to root_url
      end
    end

    describe 'POST #create' do
      it "saves the challenge to the database" do
        expect { post :create, title: "One Plus Two",
                               description: "Add one plus two",
                               code: "1 + 2",
                               test_code: "one_plus_two == 3"
        }.not_to change(Challenge.count)
      end

      it "should redirect to home page" do
        expect { post :create, title: "One Plus Two",
                               description: "Add one plus two",
                               code: "1 + 2",
                               test_code: "one_plus_two == 3"
        }.to redirect_to root_url
      end
    end

    describe 'GET #edit' do
      it "assigns the requested challenge to @challenge" do
        get :edit, id: @challenge.id
        assigns(:challenge).should_not be_valid
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
        expect { delete :destroy, id: @challenge
        }.not_to change(Challenge.count)
      end

      it "should redirect to home page" do
        delete :destroy, id: @challenge
        response.should redirect_to root_url
      end
    end
  end

  describe "when not signed in" do
    before do
      # MAKE SURE NO USER IS LOGGED IN
    end

    describe 'GET #show' do
      it "does not assign the requested challenge to @challenge" do
        get :show, id: @challenge.id
        assigns(:challenge).should_not be_valid
      end

      it "should redirect to home page" do
        get :show
        response.should redirect_to root_url
      end  
    end

    describe 'GET #new' do
      it "does not assign a new challenge object to @challenge" do
        get :new
        assigns(:challenge).should_not be_valid
      end

      it "should redirect to home page" do
        get :new
        response.should redirect_to root_url
      end
    end

    describe 'POST #create' do
      it "saves the challenge to the database" do
        expect { post :create, title: "One Plus Two",
                               description: "Add one plus two",
                               code: "1 + 2",
                               test_code: "one_plus_two == 3"
        }.not_to change(Challenge.count)
      end

      it "should redirect to home page" do
        expect { post :create, title: "One Plus Two",
                               description: "Add one plus two",
                               code: "1 + 2",
                               test_code: "one_plus_two == 3"
        }.to redirect_to root_url
      end
    end

    describe 'GET #edit' do
      it "assigns the requested challenge to @challenge" do
        get :edit, id: @challenge.id
        assigns(:challenge).should_not be_valid
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
        expect { delete :destroy, id: @challenge
        }.not_to change(Challenge.count)
      end

      it "should redirect to home page" do
        delete :destroy, id: @challenge
        response.should redirect_to root_url
      end
    end
  end
end
