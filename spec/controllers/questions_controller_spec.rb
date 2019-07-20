require "rails_helper"
RSpec.describe QuestionsController do
  describe "GET start" do
    it "returns a 200 response" do
      get :start
      expect(response.status).to eq(200)
    end

    it "assigns @user" do
      get :start
      expect(assigns(:user)).to(be_a User)
    end

  end

  describe "GET part_2" do
    it "returns a 200 response" do
      get :part_2
      expect(response.status).to eq(200)
    end
  end

  describe "GET part_3" do
    it "returns a 200 response" do
      get :part_3
      expect(response.status).to eq(200)
    end
  end
end
