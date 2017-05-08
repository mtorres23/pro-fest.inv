class Api::OrdersController < ApplicationController
  # GET /api/orders
  def index
    @orders = Order.all
  end

  def new
  end

  def create
  end

  def show
  end
end
