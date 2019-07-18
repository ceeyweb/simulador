require "rails_helper"
RSpec.describe LandingPagesController do
  describe "GET home" do
    it "returns a 200 response" do
      get :home
      expect(response.status).to eq(200)
    end
  end
end
