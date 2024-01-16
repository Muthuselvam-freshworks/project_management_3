require 'rails_helper'

RSpec.describe Devise::RegistrationsController, type: :controller do

    describe "POST #create" do
    context "with valid parameters" do
      let(:valid_params) do
        {
          user: {
            first_name: "Muthu",
            last_name: "Selvam",
            email: "muthuselvam1@gmail.com",
            password: "asdfgh",
            password_confirmation: "asdfgh"
          }
        }
      end

      it "creates a new user" do
        post :create, params: valid_params
        user = User.last

        expect(response).to be_successful
        expect(user.first_name).to eq("Muthu")
        expect(user.last_name).to eq("Sevam")
        expect(user.email).to eq("muthuselvam1@gmail.com")
      end

      it "redirects to the root path after successful sign-up" do
        post :create, params: valid_params
        expect(response).to redirect_to(dashboard_path)
      end
    end

end