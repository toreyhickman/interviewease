require 'spec_helper'

describe TopicsController, :type => :controller do
  describe 'when authenticated' do
    describe 'GET #new' do
      it 'assigns the current users company to @company' do
        pending
      end

      it 'assigns a new topic to @topic' do
        pending
      end

      it 'renders the #new view' do
        pending
      end
    end

    describe 'POST #create' do
      describe 'with valid attributes' do
        it 'saves the topic to the database' do
          pending
        end

        it 'redirects to the company page' do
          pending
        end
      end

      describe 'with invalid attributes' do
        it 'does not save the topic to the database' do
          pending
        end

        it 're-renders the :new view' do
          pending
        end
      end
    end
  end

  describe 'when unauthenticated' do
    describe 'GET #new' do
      it 'redirects to sign in page' do
        pending
      end
    end

    describe 'POST #create' do
      it 'doesnt save the topic to the database' do
        pending
      end
      
      it 'redirects to the sign in page' do
        pending
      end
    end
  end
end
