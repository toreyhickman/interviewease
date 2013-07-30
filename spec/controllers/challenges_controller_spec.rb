require 'spec_helper'

describe ChallengesController, :type => :controller do
  before do
    @challenge = Challenge.create(title: "One Plus One", description: "Add one plus one", code: "1 + 1", test_code: "one_plus_one == 2")
  end

  describe 'GET #show' do
    it "assigns the requested challenge to @challenge" do
      get :show
      assigns(:challenge).should eq @challenge
    end

    it "renders the #show view" do
      get :show
      response.should render_tempate :show
    end
  end

  describe 'GET #new' do
    it "assigns a new challenge object to @challenge" do
      pending
    end

    it "renders the #new view" do
      pending
    end
  end

  describe 'POST #create' do
    context "with valid attributes" do
      it "saves the challenge to the database" do
        pending
      end

      it "redirects to ???" do
        pending
      end
    end

    context "with invalid attributes" do
      it "does not save the challenge to the database" do
        pending
      end

      it "re-renders the #new partial" do
        pending
      end
    end
  end

  describe 'GET #edit' do
    it "assigns the requested challenge to @challenge" do
      pending
    end

    it "renders the #edit view" do
      pending
    end
  end

  describe 'POST #update' do
    context "with valid attributes" do
      it "saves the updated challenge to the database" do
        pending
      end

      it "redirects to the ??? view" do
        pending
      end
    end

    context "with invalid attributes" do
      it "does not save the changes to the database" do
        pending
      end

      it "re-renders the #edit view" do
        pending
      end
    end

    context "when unauthorized" do
      it "does not save the changes to the database" do
        pending
      end
    end
  end

  describe 'DELETE #destroy' do
    context "when authorized" do
      it "deletes the challenge from the database" do
        pending
      end

      it "should redirect to ???" do
        pending
      end
    end

    context "when unauthorized" do
      it "does not delete the challenge from the database" do
        pending
      end
    end
  end
end
