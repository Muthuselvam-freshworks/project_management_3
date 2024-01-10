require 'rails_helper'

RSpec.describe "RegistrationControllers", type: :request do
  describe "POST #create" do
    context "with valid parameters" do
      let(:valid_params) do
        {
            first_name: "Muthu",
            last_name: "Selvam",
            email: "muthuselvam1@gmail.com",
            password: "asdfgh",
            password_confirmation: "asdfgh"

        }
      end

      it "creates a new user" do
        post '/users/sign_up', params: valid_params
      expect(response).to have_http_status(302)
      end

      it "redirects to the root path after successful sign-up" do
        post '/users/sign_up', params: valid_params
      expect(response).to redirect_to(dashboard_path)
      end
    end
  end
end
