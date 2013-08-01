require 'spec_helper'

describe InterviewsController, :type => :controller do

  describe 'GET #show' do
  end

  describe 'PUT #update' do

    it 'assigns the requested interview to @interview' do
      pending
    end

    describe 'when authorized' do
      describe 'with valid attributes' do
        it 'saves the updated interview to the database' do
          pending
        end

        it 'redirects to the interview feedback' do
          pending
        end
      end

      describe 'with invalid attributes' do
        it 'doesnt save the updated interview to the database' do
          pending
        end

        it 'redirects to the home page' do
          pending
        end
      end
    end

    describe 'when unauthorized' do
      it 'doesnt save the updated interview to the database' do
        pending
      end

      it 'redirects to the home page' do
        pending
      end
    end

    describe 'when authenticated' do
      it 'doesnt save the updated interview to the database' do
        pending
      end

      it 'redirects to the sign in page' do
        pending
      end
    end
  end
end
