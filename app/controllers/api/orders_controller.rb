class Api::OrdersController < ApplicationController
  # GET /api/orders
  def index
    @orders = Order.all
  end

  def new
    @orders = Order.new

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
    @orders = Order.find_by(params[:id])
  end


  private

  def order_params
    params.require(:orders).permit(:content).merge(:category_id => 1)

    end

end
