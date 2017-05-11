class OrdersController < ApplicationController
  before_action :set_client
  before_action :set_event, only: [:orders_by_event,:edit, :update, :destroy]


  def orders_by_client
    @orders = @client.orders
  end

  def orders_by_event
    @orders = @event.orders
    @locations = @event.locations
  end

  def orders_by_location
    @location = Location.find(params[:location_id])
    @orders = @location.orders
  end

  def new
    @order = Order.new

    render :new
  end

  def create
    puts "create"
    puts @orders
    order = Order.new(order_params)
    order.save

    redirect_to event_location_orders_path
  end

  def show
    @orders = Order.find(params[:id])
  end

  def update
    order = Order.find(params[:id])
    order.update(order_params)

    redirect_to event_location_orders_path
  end

  def edit
    @orders = Order.find(params[:id])
  end


  private

  def set_event
    @event = @client.events.find(params[:id])
  end


  def order_params
    params.require(:order).permit(:content).merge(:category_id => 1)
  end

  def set_client
    @client = Client.find(current_user.client_id)
  end


end
