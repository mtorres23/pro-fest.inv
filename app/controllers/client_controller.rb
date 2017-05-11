class ClientController < ApplicationController
  before_action :authenticate_user!
  before_action :set_client
  
  def dashboard
    @orders = Order.all
    @locations = @client.events.locations
  end

  private
  def set_client
    @client = Client.find(current_user.client_id)
  end

end
