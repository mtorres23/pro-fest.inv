class Api::ItemsController < ApplicationController
  # GET /api/items
  def index
    @items = Item.all

    render json: @items
  end
end