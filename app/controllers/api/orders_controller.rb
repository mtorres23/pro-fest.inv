class Api::OrdersController < ApplicationController
  # GET /api/orders
  def index
    @orders = Order.all
  end

  def new
    @client = Client.find(params[:client_id])
    @order = Order.new

    render :new
  end

  def create
    puts "create"
    puts @orders
    order = Order.new(order_params)
    order.save

    redirect_to api_orders_path
  end

  def show
    @orders = Order.find(params[:id])
  end

  def update
    order = Order.find(params[:id])
    order.update(order_params)
    redirect_to api_orders_path
  end

  def edit
    @orders = Order.find(params[:id])
  end


  private

  def order_params
    params.require(:order).permit(:content).merge(:category_id => 1)

    end

end
