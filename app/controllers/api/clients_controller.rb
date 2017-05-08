class Api::ClientsController < ApplicationController
  # GET /api/clients
  def index
    @clients = Client.all

    render json: @clients
  end
end