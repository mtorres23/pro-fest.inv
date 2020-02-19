class ItemsController < ApplicationController
  include ItemsHelper
    before_action :authenticate_user!
    before_action :set_account
    before_action :set_location

    def inventory
        @products = @account.products
        @items = @location.items
        @orders = @location.event.orders
        @pickup_orders = find_matching_orders(@orders, @location, "pickup")
        @dropoff_orders = find_matching_orders(@orders, @location, "dropoff")
    end


    # GET /items/new
    def new
        @products = @account.products
        @item = @location.items.new
    end

    # GET /items/:id/edit
    def edit
      @item = @location.items.find(params[:id])
    end

    # POST /items
    # POST /items.json
    def create
      @item = @location.items.new(item_params)

      respond_to do |format|
        if @item.save
          format.html { redirect_to location_inventory_path(id: @item.id), notice: 'Inventory Item was successfully added.' }
          format.json { render :show, status: :created, location: @item }
        else
          format.html { render :new }
          format.json { render json: @item.errors, status: :unprocessable_entity }
        end
      end
    end

    # PATCH/PUT /items/1
    # PATCH/PUT /items/1.json
    def update_item
      @item = @location.items.find(params[:id])

      respond_to do |format|
        if @item.update_attributes(item_params)
          format.html { redirect_to location_inventory_path(id: @item.id), notice: 'Inventory Item was successfully updated.' }
          format.json { render :show, status: :ok, location: @item }
        else
          format.html { render :edit }
          format.json { render json: @item.errors, status: :unprocessable_entity }
        end
      end
    end

    # DELETE /items/1
    # DELETE /items/1.json
    def destroy
     @item = @location.items.find(params[:id])
      @item.destroy
      respond_to do |format|
        format.html { redirect_to location_url, notice: 'Item was successfully removed from Inventory.' }
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

      def set_location
        @location = Location.find(params[:location_id])
      end


      # Never trust parameters from the scary internet, only allow the white list through.
      def item_params
        return params.require(:item)
        .permit(:item_id, :quantity, :sale_price, :category, :product_id)
        .merge(location_id: @location.id)
      end
  end
