require 'spec_helper'

describe CompaniesController, :type => :controller do
  before do
    @company = Company.create(name: Faker::Name.name)
    @employee = @company.employees.create(
      name: Faker::Name.name,
      email: Faker::Internet.email,
      password: "password")

    @incorrect_company = Company.create(name: Faker::Name.name)
    @incorrect_employee = @incorrect_company.employees.create(
      name: Faker::Name.name,
      email: Faker::Internet.email,
      password: "password")
  end

  describe "with authorization" do
    before do
      session[:user_id] = @employee.id
    end

    describe 'GET #show' do
      it "assigns the requested company to @company" do
        get :show, id: @company.id
        assigns(:company).should eq @company
      end

      it "renders the :show view" do
        get :show, id: @company.id
        response.should render_template :show
      end
    end

    after do
      session[:user_id] = nil
    end
  end

  describe "without authorization" do
    before do
      session[:user_id] = @incorrect_employee.id
    end

    describe 'GET #show' do
      it "should not assign the requested company to @company" do
        get :show, id: @company.id
        assigns(:company).should_not eq @company
      end

      it "should redirect to root_url" do
        get :show, id: @company.id
        response.should redirect_to root_url
      end
    end

    after do
      session[:user_id] = nil
    end
  end

  describe "without authentication" do
    describe 'GET #show' do
      it "should not assign the requested company to @company" do
        get :show, id: @company.id
        assigns(:company).should_not eq @company
      end

      it "should redirect to root_url" do
        get :show, id: @company.id
        response.should redirect_to new_session_path
      end
    end
  end

  describe 'POST #create' do
    describe "with valid attributes" do
      it "should save the company to the database" do
        expect { post :create, { name: Faker::Name.name,
                        employee: { name: Faker::Name.name,
                                    email: Faker::Internet.email,
                                    password: "password" } }
          }.to change { Company.count }.by(1)
      end

      it "should save the employee to the database" do
        expect { post :create, { name: Faker::Name.name,
                        employee: { name: Faker::Name.name,
                                    email: Faker::Internet.email,
                                    password: "password" } }
          }.to change { Employee.count }.by(1)
      end

      it "should redirect to the company created" do
        post :create, { name: Faker::Name.name,
                        employee: { name: Faker::Name.name,
                                    email: Faker::Internet.email,
                                    password: "password" } }
        response.should redirect_to Company.last
      end
    end

    describe "with invalid attributes" do
      it "should not save the company to the database" do
        expect { post :create, { name: "",
                        employee: { name: "",
                                    email: "",
                                    password: "" } }
          }.not_to change { Company.count }
      end

      it "should not save the employee to the database" do
        expect { post :create, { name: "",
                        employee: { name: "",
                                    email: "",
                                    password: "" } }
          }.not_to change { Employee.count }
      end

      it "should re-render the company create form" do
        pending
        #
        # This functionality needs to be implemented...
        #
        # expect { post :create, { name: ""
        #                 employee: { name: "",
        #                             email: "",
        #                             password: "" } }
        # response.should render_template :new
      end
    end
  end
end
