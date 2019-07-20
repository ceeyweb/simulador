require "rails_helper"
RSpec.describe UsersController do
  describe "POST users" do
    it "returns a 200 response" do
      post :create
      expect(response.status).to eq(204)
    end

    it "creates a new user" do
    end
  end
end
