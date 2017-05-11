class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!

  def dashboard
    @orders = Order.all
    @locations = @client.events.locations
  end



end
