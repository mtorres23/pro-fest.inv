class BinsController < ApplicationController
    before_action :authenticate_user!
    before_action :set_client
    before_action :set_location

    def inventory
        @items = @client.items
        @bins = @location.bins
    end

    # def show
    #     @item = @location.bins.find(params[:id])
    # end

    # GET /bins/new
    def new
        @items = @client.items
      @bin = @location.bins.new
    end

    # GET /bins/:id/edit
    def edit
      @bin = @location.bins.find(params[:id])
    end

    # POST /bins
    # POST /bins.json
    def create
      @bin = @location.bins.new(bin_params)

      respond_to do |format|
        if @bin.save
          format.html { redirect_to location_inventory_path(id: @bin.id), notice: 'Inventory was successfully added.' }
          format.json { render :show, status: :created, location: @bin }
        else
          format.html { render :new }
          format.json { render json: @bin.errors, status: :unprocessable_entity }
        end
      end
    end

    # PATCH/PUT /bins/1
    # PATCH/PUT /bins/1.json
    def update_item
      @bin = @location.bins.find(params[:id])

      respond_to do |format|
        if @bin.update_attributes(bin_params)
          format.html { redirect_to location_inventory_path(id: @bin.id), notice: 'Inventory was successfully updated.' }
          format.json { render :show, status: :ok, location: @bin }
        else
          format.html { render :edit }
          format.json { render json: @bin.errors, status: :unprocessable_entity }
        end
      end
    end

    # DELETE /bins/1
    # DELETE /bins/1.json
    def destroy
     @bin = @location.bins.find(params[:id])
      @bin.destroy
      respond_to do |format|
        format.html { redirect_to location_url, notice: 'Item was successfully removed from Inventory.' }
        format.json { head :no_content }
      end
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_client
        if current_user && current_user.permission_level?
        @client = Client.find(current_user.client_id)
        elsif current_user && current_user.permission_level?
        @client = Client.find(current_user.client_id)
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
      def bin_params
        return params.require(:bin)
        .permit(:item_id, :qty)
        .merge(location_id: @location.id )
      end
  end
