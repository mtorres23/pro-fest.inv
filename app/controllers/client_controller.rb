class ClientController < ApplicationController
  layout false

  def dashboard
    @orders = Order.all
    @locations = Location.all
  end
end
