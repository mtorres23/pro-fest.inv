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
    order = Order.create(order_params)
    order.save

    redirect_to api_orders_path
  end

  def show
  end


  private

  def order_params
    params.require(:order).permit(:content, :verified_by, :delivery_date, :total_price, :total_amount, :type)

    end

end
