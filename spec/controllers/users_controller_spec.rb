require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  describe "GET #show" do
    it "returns http success" do
      get :show
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #secret" do
    it "returns http success" do
      get :secret
      expect(response).to have_http_status(:success)
    end
  end


  describe "GET #edit" do
    it "returns http success" do
      get :edit
      expect(response).to have_http_status(:success)
    # des tests
    end
  end



  describe "PUT #update" do
    it "returns http success" do
      get :update
      expect(response).to have_http_status(:success)
    # des tests
    end
  end

end
