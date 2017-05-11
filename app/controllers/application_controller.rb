class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
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
