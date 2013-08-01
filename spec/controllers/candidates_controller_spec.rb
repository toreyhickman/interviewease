require 'spec_helper'

describe CandidatesController, :type => :controller do
  describe 'POST #create' do
    before do
      @company = Company.create(name: "test")
      @employee = @company.employees.create(name: "test", email: "test", password: "test")

      @unauth_company = Company.create(name: "test2")
      @unauth_employee = @company.employees.create(name: "test2", email: "test2", password: "test2")
    end

    describe 'when authenticated' do
      before do
        session[:user_id] = @employee.id
      end

      describe 'with valid parameters' do
        describe 'if existing candidate' do
          before do
            @candidate = @employee.company.candidates.create(name: "test", email: "test")
          end

          it 'assigns candidate to @candidate' do
            post :create, { candidate: { name: @candidate.name, email: @candidate.email } }
            assigns(:candidate).should eq @candidate
          end
        end

        describe 'if new candidate' do
          it 'assigns candidate to @candidate' do
            post :create, { candidate: { name: "name", email: "email" } }
            assigns(:candidate).is_a? Candidate
          end

          it 'updates candidate in database' do
            expect { post :create, { candidate: { name: "name", email: "email" } }
              }.to change { Candidate.count }.by(1)
          end
        end

        it 'redirects back to the signed in user' do
          post :create, { candidate: { name: "name", email: "email" } }
          response.should redirect_to @employee
        end
      end

      describe 'with invalid parameters' do
        it 'does not save the candidate to the database' do
          expect { post :create, { candidate: { name: "", email: "" } }
            }.not_to change { Candidate.count }
        end

        it 'redirects back to the signed in user' do
          post :create, { candidate: { name: "", email: "" } }
          response.should redirect_to @employee
        end
      end

      after do
        session[:user_id] = nil
      end
    end

    describe 'when unauthenticated' do
      it 'should not save to the database' do
        expect { post :create, { candidate: { name: "test", email: "test" } }
          }.not_to change { Candidate.count }
      end

      it 'should redirect to log in page' do
        post :create, { candidate: { name: "test", email: "test" } }
        response.should redirect_to new_session_path
      end
    end
  end
end
