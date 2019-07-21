require "rails_helper"
RSpec.describe UsersController do
  describe "POST users" do

    describe "with valid params" do
      def do_request
        post :create, params: {
          user: {
            edad: 5,
            ip_address: "0.0.0.0",
            estado_residencia: "Chiapas",
            ultimo_grado_cursado: "1° Primaria",
            sexo: "2",
            asistes_escuela: true,
          },
        }
      end

      it "creates a new user" do
        expect { do_request }.to change { User.count }.from(0).to(1)
      end

      it "returns a 204 response" do
        do_request
        expect(response.status).to eq(204)
      end

      it "sets the user_id cookie" do
        do_request
        expect(response.cookies["user_id"]).to be_present
      end
    end
  end
end
