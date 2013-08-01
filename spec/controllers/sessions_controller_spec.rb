require 'spec_helper'

describe SessionsController, :type => :controller do
  describe 'GET #new' do

  end

  describe 'POST #create' do
    it 'assigns the requested employee to @employee' do
      pending
    end

    describe 'with valid attributes' do
      it 'sets the session' do
        pending
      end

      it 'redirects to employee profile' do
        pending
      end
    end

    describe 'with invalid attributes' do
      it 'doesnt set the session' do
        pending
      end

      it 'redirects to the home page' do
        pending
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'should clear all sessions' do
      pending
    end

    it 'should redirect to the home page' do
      pending
    end
  end
end
