class Api::EventsController < ApplicationController
  # GET /api/events
  def index
    @events = Event.all

    render json: @events
  end
end