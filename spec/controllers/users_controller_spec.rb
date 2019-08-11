require "rails_helper"
RSpec.describe UsersController do
  describe "POST users" do

    describe "with valid params" do
      def do_request
        post :create, params: {
          user: {
            ip_address: "0.0.0.0",
            father_age: 51,
            father_residency_id: 8,
            father_education_grade_id: 7,
            mother_age: 47,
            mother_residency_id: 8,
            mother_education_grade_id: 8,
            age: 22,
            residency_id: 8,
            sex_id: 1,
            education_grade_id: 7,
            is_student: true,
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

  describe "PUT user" do
    before do
      @user = create(:user)
    end

    describe "with valid params" do
      it "updates the permitted params of user" do
        put :update, params: {
          id: @user.id,
          next_step: question_part_3_path,
          user: {
            is_employed: 1,
            ip_address: "9.9.9.9", # unpermitted param
          },
        }

        expect(@user.reload.is_employed).to be(true)
        expect(@user.ip_address).not_to eq("9.9.9.9")
      end

      it "redirects to the next_step param" do
        put :update, params: {
          id: @user.id,
          next_step: question_part_3_path,
          user: {
            is_employed: 1,
          },
        }
        expect(response).to redirect_to question_part_3_path
      end
    end

    describe "with invalid params" do
      it "ignores next_step param if malicious" do
        malicious_url = "https://www.malicious.com/phishing"
        put :update, params: {
          id: @user.id,
          next_step: malicious_url,
          user: {
            is_employed: 1,
          },
        }
        expect(response).not_to redirect_to malicious_url
        expect(response).to redirect_to "/phishing"
      end
    end
  end
end
