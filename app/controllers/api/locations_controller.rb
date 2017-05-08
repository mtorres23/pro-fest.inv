class Api::LocationsController < ApplicationController
  # GET /api/locations
  def index
    @locations = Location.all

    render json: @locations
  end
end