class Api::ClientsController < ApplicationController
  # GET /api/clients
  def index
    @clients = Client.all
    render json: @clients
  end

  def show
  	@client = Client.find(params[:client_id])
  	@event = @client.events.find(params[:event_id])
  	@location = @event.locations.find(params[:location_id])
  	@categories = @location.categories.find(params[:category_id])
  	@order = @category.orders.find(params[:order_id])
  end
end

private 

def client_params

end