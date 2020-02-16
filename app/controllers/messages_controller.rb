class MessagesController < ApplicationController
  before_action :set_event, only: [:event_feed]
  before_action :set_location, only: [:location_feed]

  def event_feed
    @messages = @event.messages
  end

  def location_feed
  end

  def create
  end

  def update
  end

  def destroy
  end

  private

  def set_event
    @event = @account.events.find(params[:event_id])
  end

  def set_location
    @location = Location.find(params[:location_id])
  end
end
