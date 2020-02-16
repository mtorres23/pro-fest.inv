require 'rails_helper'

RSpec.describe MessagesController, type: :controller do

  describe "GET #event_feed" do
    it "returns http success" do
      get :event_feed
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #location_feed" do
    it "returns http success" do
      get :location_feed
      expect(response).to have_http_status(:success)
    end
  end

end
