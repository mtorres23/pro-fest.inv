require 'rails_helper'

RSpec.describe HomePagesController, type: :controller do

  describe "GET #home" do
    it "returns http success" do
      get :home
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #about" do
    it "returns http success" do
      get :about
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #faqs" do
    it "returns http success" do
      get :faqs
      expect(response).to have_http_status(:success)
    end
  end

end
