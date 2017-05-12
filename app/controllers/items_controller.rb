class ItemsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_client
  before_action :set_location, only: [:location_items]
  
  def index
    @items = @client.items
  end

  def location_items
  	@items = @location.items
  end	

  def show
  	@item = @client.items.find(params[:id])
  end

  # GET /items/new
  def new
    @item = @client.items.new
  end

  # GET /items/:item_id/edit
  def edit
    @item = @client.items.find(params[:id])
  end

  # POST /items
  # POST /items.json
  def create
    @item = @client.items.new(item_params)

    respond_to do |format|
      if @item.save
        format.html { redirect_to @item, notice: 'Item was successfully added.' }
        format.json { render :show, status: :created, location: @item }
      else
        format.html { render :new }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /items/1
  # PATCH/PUT /items/1.json
  def update
    @item = @client.items.find(params[:id])

    respond_to do |format|
      if @item.update_attributes(item_params)
        format.html { redirect_to @item, notice: 'Item was successfully updated.' }
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
   @item = @client.items.find(params[:id])
    @item.destroy
    respond_to do |format|
      format.html { redirect_to items_url, notice: 'Item was successfully removed from Inventory.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_client
      if current_user && current_user.is_event_admin?
      @client = Client.find(current_user.client_id)
      elsif current_user && current_user.is_crew?
      @client = Client.find(current_user.client_id)
      else
      redirect_to home_pages_home_path
    end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def item_params
      return params.require(:item)
      .permit(:title, :upc, :description, :qty, :color, :size, :weight, :sale_price, :lowest_recorded_price, :images)
    end
end
