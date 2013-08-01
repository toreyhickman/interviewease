require 'spec_helper'

describe FeedbacksController, :type => :controller do
  describe 'when authenticated' do
    describe 'GET #new' do
      it 'assigns the interview to @interview' do
        pending
      end

      it 'assigns the companies questions to @questions' do
        pending
      end

      it 'renders the :new view' do
        pending
      end
    end

    describe 'POST #create' do
      it 'saves the responses to the database' do
        pending
      end

      it 'updates the recommend_hire attribute for the interview' do
        pending
      end

      it 'redirects to the current_user page' do
        pending
      end
    end
  end

    describe 'when unauthenticated' do
    describe 'GET #new' do
      it 'doesnt assign the interview to @interview' do
        pending
      end

      it 'doesnt assign the companies questions to @questions' do
        pending
      end

      it 'redirects to log in page' do
        pending
      end
    end

    describe 'POST #create' do
      it 'doesnt save responses to the database' do
        pending
      end

      it 'doesnt update the recommend_hire attribute for the interview' do
        pending
      end

      it 'redirects to log in page' do
        pending
      end
    end
  end
end
