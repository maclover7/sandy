require "rails_helper"

RSpec.describe Api::V1::UsersController, type: :controller do
  describe 'POST #create' do
    before do
      @request.env["devise.mapping"] = Devise.mappings[:user]
    end
    
    context "with valid attributes" do
      it "creates a new user" do
        expect {
          post :create, user: FactoryGirl.attributes_for(:user), format: :json
          } .to change(User, :count).by(1)
      end
      it "creates a new user, making sure response is #201" do
        post :create, user: FactoryGirl.attributes_for(:user), format: :json
        @response.status.should eq(201)
      end
    end
    context "with invalid attributes" do
      it "returns 422" do
        post :create, user: FactoryGirl.attributes_for(:user, email: nil, password: nil), format: :json
        @response.status.should eq(422)
      end
    end
  end
  
  describe 'PUT #update' do
    before do
      @request.env["devise.mapping"] = Devise.mappings[:user]
    end
    
    context "with valid attributes" do
      it "updates a user" do
        put :update, user_id: @user, user: FactoryGirl.attributes_for(:user, email: "test1@example.com")
        @user.reload
        @user.email.should eq("test1@example.com")
      end
      it "updates a user, making sure response is #200" do
        post :create, user: FactoryGirl.attributes_for(:user), format: :json
        @response.status.should eq(201)
      end
    end
    context "with invalid attributes" do
      it "returns 422" do
        post :create, user: FactoryGirl.attributes_for(:user, email: nil, password: nil), format: :json
        @response.status.should eq(422)
      end
    end
  end
end