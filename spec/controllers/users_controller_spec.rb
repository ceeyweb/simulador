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

      it "redirects to questions 2" do
        expect(do_request).to redirect_to(question_part_2_path)
      end

      it "sets the user_id cookie" do
        do_request
        expect(response.cookies["user_id"]).to be_present
      end
    end
  end
end
