class OrdersController < ApplicationController
  include OrderHelper

  before_action :set_account
  before_action :set_location, except: [:orders_by_account, :orders_by_event]
  before_action :set_event, only: [:index, :orders_by_event,:edit, :update, :destroy, :show, :confirm]
  before_action :invalid_transactions, only: [:confirm]

  def index
    @orders = @event.orders
    @locations = @event.locations
  end

  def orders_by_account
    @orders = @account.orders
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
    @event = @location.event
    @order = @location.orders.new(order_params)
      respond_to do |format|
        if @order.save
          format.html { redirect_to event_location_order_path(event_id: @event.id, location_id: @location.id, id: @order.id ), notice: 'Order was successfully created.' }
          format.json { render json: @order, status: :created } # Redirect Maybe?
        else
          format.html { render :new }
          format.json { render json: @order.errors, status: :unprocessable_entity }
        end
      end
  end

  def show
    @order = @location.orders.find(params[:id])
    @transactions = @order.transactions
  end

  def update
    order = @location.orders.find(params[:id])
    respond_to do |format|
      if order.update_attributes(order_params)
        format.html { redirect_to event_location_order_path(event_id: @event.id, location_id: @location.id, id: order.id ), notice: 'Order was successfully updated.' }
        format.json { render :show, status: :ok, location: order }
      else
        format.html { render :edit }
        format.json { render json: order.errors, status: :unprocessable_entity }
      end
    end
  end

  def confirm

    @order = @location.orders.find(params[:id])
    # @transactions = @order.transactions
    if !invalid_transactions
      process_transactions(@order.transactions)
      @order.update(status: 'verified')
      redirect_to event_location_order_path(event_id: @event.id, location_id: @location.id, id: @order.id ), notice: 'Order was successfully confirmed.'
    else
      render json: 'error: Transactions are not fulfilled', status: :bad_request
  end
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
    return params.require(:order)
    .permit(:message, :role, :origin_id, :destination_id, :due_date, :status, :verified_by)
    .merge(:created_by => current_user.id, location_id: @location.id)
  end

  def set_account
    @account = Account.find(current_user.account_id)
  end

  def set_transactions
    return Order.find(params[:id]).transactions
  end

  def invalid_transactions
    invalid = false
    set_transactions.each do |t|
      if !['completed', 'canceled', 'verified'].include?(t.status)
        invalid = true
      end
    end
    return invalid
  end

end
