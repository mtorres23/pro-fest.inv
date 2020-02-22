class MessagesController < ApplicationController
  before_action :set_event, only: [:event_feed, :create]
  before_action :set_location, only: [:location_feed]

  def event_feed
    @messages = @event.messages
    @message = @event.messages.new
  end

  def location_feed
  end

  def create
    @message = @event.messages.new(message_params)
    respond_to do |format|
      if @message.save!
        format.html { redirect_to event_feed_path(@event), notice: 'Message was successfully created.' }
        format.json { render json: @message, status: :created } # Redirect Maybe?
      else
        format.html { render :event_feed }
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end
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

  def message_params
    return params.require(:message)
        .permit(:text, :min_access_level, :location_id, :order_id, :transaction_id)
        .merge(event_id: @event.id, created_by: current_user.id, message_type: "staff_message")
  end
end
