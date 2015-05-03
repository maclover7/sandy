require "rails_helper"

RSpec.describe Api::V1::UsersController, type: :controller do
  describe 'POST #create' do
    context "with valid attributes" do
      it "creates a new user" do
      end
      it "creates a new user, making sure response is #201" do
      end
    end
    context "with invalid attributes" do
      it "returns 422" do
      end
    end
  end
end