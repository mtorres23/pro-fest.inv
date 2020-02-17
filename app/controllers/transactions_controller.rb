class TransactionsController < ApplicationController
  include TransactionHelper
    before_action :authenticate_user!
    before_action :set_account
    before_action :set_products
    before_action :set_event
    before_action :set_location
    before_action :set_items
    before_action :set_order

    def get
        @products = @account.products
        @transactions = @location.transactions
    end

    def show
        @locations = Location.where(event_id: @event.id)
        @transaction = @order.transactions.find(params[:id])
        @origin = @locations.find_by({id: @transaction.origin_id}).title if @transaction.origin_id
        @destination = @locations.find_by({id:@transaction.dest_id}).title if @transaction.dest_id
        @item = Item.find(@transaction.item_id)
        @product = Product.find(@item.product_id)
    end

    # GET /transactions/new
    def new
      @transaction = @order.transactions.new
      @locations = Location.where(event_id: @event.id)
    end

    # GET /transactions/:id/edit
    def edit
      @transaction = @order.transactions.find(params[:id])
      @locations = @event.locations
    end

    # POST /transactions
    # POST /transactions.json
    def create
        @locations = @event.locations
        @transaction = @order.transactions.new(transaction_params)

      respond_to do |format|
        if @transaction.save
          format.html { redirect_to event_location_order_transaction_path(event_id: @event.id, order_id: @order.id, id: @transaction.id), notice: 'Transaction was successfully added to Order.' }
          format.json { render :show, status: :created, location: @transaction }
        else
          format.html { render :new }
          format.json { render json: @transaction.errors, status: :unprocessable_entity }
        end
      end
    end

    # PATCH/PUT /transactions/1
    # PATCH/PUT /transactions/1.json
    def update
      @transaction = @order.transactions.find(params[:id])

      respond_to do |format|
        if @transaction.update_attributes(transaction_params)
          create_transaction_message(@transaction)
          format.html { redirect_to event_location_order_transaction_path(event_id: @event.id, order_id: @order.id, id: @transaction.id), notice: 'Transaction was successfully updated.' }
          format.json { render :show, status: :ok, location: @transaction }
        else
          format.html { render :edit }
          format.json { render json: @transaction.errors, status: :unprocessable_entity }
        end
      end
    end

    # DELETE /transactions/1
    # DELETE /transactions/1.json
    def destroy
     @transaction = @order.transactions.find(params[:id])
      @transaction.destroy
      respond_to do |format|
        format.html { redirect_to event_location_order_path(@event, @location, @order), notice: 'Transaction was removed from order.' }
        format.json { head :no_content }
      end
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_account
        if current_user && current_user.permission_level?
        @account = Account.find(current_user.account_id)
        elsif current_user && current_user.permission_level?
        @account = Account.find(current_user.account_id)
        else
        self.send(:set_location)
        @event = @location.event
        redirect_to event_location_path(event_id: @event, id: @location)
      end
      end
      def set_products
        @products = Product.where(account_id: Account.first.id)
      end
      def set_event
        @event = @account.events.find(params[:event_id])
      end

      def set_location
        @location = Location.find(params[:location_id])
      end

      def set_items
        @items = @location.items
      end

      def set_order
        @order = Order.find(params[:order_id])
      end

      # Never trust parameters from the scary internet, only allow the white list through.
      def transaction_params
        return params.require(:transaction)
        .permit(:item_id, :dest_id, :origin_id, :status, :qty)
        .merge(order_id: @order.id)
      end
end
