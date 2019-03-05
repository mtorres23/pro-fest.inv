class OrdersController < ApplicationController

  before_action :set_client
  before_action :set_location, except: [:orders_by_client, :orders_by_event]
  before_action :set_event, only: [:index, :orders_by_event,:edit, :update, :destroy]

  def index
    @orders = @event.orders
    @locations = @event.locations
  end

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
    @order = @location.orders.new

    render :new
  end

  def create
    puts "create"
    puts @orders
    @order = @location.orders.new(order_params)
    binding.pry
      respond_to do |format|
        if @order.save
          format.html { redirect_to order_path(location_id: @location.id, id: @order.id ), notice: 'Order was successfully created.' }
          format.json { render json: @order, status: :created } # Redirect Maybe?
        else
          format.html { render :new }
          format.json { render json: @order.errors, status: :unprocessable_entity }
        end
      end
  end

  def show
    @order = @location.orders.find(params[:id])
  end

  def update
    order = @location.orders.find(params[:id])
    order.update(order_params)

    redirect_to location_orders_path
  end

  def edit
    @order = @location.orders.find(params[:id])
  end


  private

  def set_event
    @event = Event.find(params[:event_id])
  end

  def set_location
    @location = Location.find(params[:location_id])
  end

  def order_params

    params.require(:order).permit(:content, :role, :category_id, :origin_id, :destination_id)
  end

  def set_client
    @client = Client.find(current_user.client_id)
  end



end
