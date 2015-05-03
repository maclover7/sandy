require "rails_helper"

RSpec.describe Api::V1::UsersController, type: :controller do
  describe 'POST #create' do
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
        post :create, user: FactoryGirl.attributes_for(:user, email: nil), format: :json
        @response.status.should eq(422)
      end
    end
  end
end