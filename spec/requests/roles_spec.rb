require "rails_helper"

describe "/roles" do
  let(:valid_params) {
    {
      name: "user.edit"
    }
  }

  let(:invalid_params) {
    {
      name: ""
    }
  }

  let(:user) { FactoryBot.create(:user, :user_with_roles) }

  describe "GET /show" do
    it "returns a successful response" do
      get user_role_path(user)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new record" do
        expect {
          post user_role_path(user), params: { role: valid_params }
        }.to change(User, :count).by(1)
      end

      it "returns a successful response status" do
        post user_role_path(user), params: { role: valid_params }
        expect(response).to be_successful
      end
    end

    context "with invalid parameters" do
      it "does not create a new record" do
        expect {
          post user_role_path(user), params: { role: invalid_params }
        }.not_to change(user.roles, :count)
      end

      it "returns an error response status" do
        post user_role_path(user), params: { role: invalid_params }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end
end
