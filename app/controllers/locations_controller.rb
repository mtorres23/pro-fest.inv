class LocationsController < ApplicationController
  include ItemsHelper
  include LocationsHelper
  before_action :set_account
  before_action :set_event
  before_action :set_location, only: [:location_json, :show, :edit, :update, :destroy, :pickup_order, :dropoff_order]

  def index
    @locations = @event.locations.where(hidden: nil)
  end
# GET api/events/:event_id/locations
  def index_as_json
    @locations = @event.locations.where(hidden: nil)
    render json: @locations
  end

  # GET api/events/:event_id/locations/:id
  def location_json
    @location = @event.locations.find(params[:id])
    render json: @location
  end

  # GET /locations/update
  def map_edit
    @locations = @event.locations.all
    render json: @locations
  end

  # def new
  #   puts @event
  #   puts params[:event_id]
  #   @event = @account.events.find(params[:event_id])
  #   @location = @event.locations.new
  # end

  def create
    if params[:location][:latitude] == nil
      params[:location][:latitude] = @event.latitude
      puts 'Setting Location Coordinates to Event coords'
    end
    if params[:location][:longitude] == nil
      params[:location][:longitude] = @event.longitude
    end
    @location = @event.locations.new(location_params)

    respond_to do |format|
      if @location.save
        format.html { redirect_to event_location_path(event_id: @location.event_id, id: @location.id), notice: 'Location was successfully created.' }
        format.json { render json: @location, status: :created } # Redirect Maybe?
      else
        format.html { render :new }
        format.json { render json: @location.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
    @location = @event.locations.find(params[:id])
  end

  def edit
    @location = @event.locations.find(params[:id])
  end

  def pickup_order
    @orders = @event.orders
    @pickup_orders = find_matching_orders(@orders, @location, "pickup")
  end

  def dropoff_order
    @orders = @event.orders
    @dropoff_orders = find_matching_orders(@orders, @location, "dropoff")
  end

 # PATCH/PUT /locations/1
  # PATCH/PUT /locations/1.json
  def update
    @location = @event.locations.find(params[:id])

    respond_to do |format|
      if @location.update_attributes(location_params)
        puts "This is what is firing"
        format.html { redirect_to event_location_path(event_id: @location.event_id, id: @location.id), notice: 'Location was successfully updated.' }
        format.json { render json: @location, status: :ok, location: event_location_url(@location) }
      else
        format.html { render :edit }
        format.json { render json: @location.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /locations/1
  # DELETE /locations/1.json
  def destroy
    @location = @event.locations.find(params[:id])
    @location.destroy
    respond_to do |format|
      format.html { redirect_to @event, notice: 'Location was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  private

  def set_account
    @account = Account.find(current_user.account_id)
  end

  def set_event
      @event = @account.events.find(params[:event_id])
  end

  def set_location
      @location = @event.locations.find(params[:id])
  end

  def location_params
    return params.require(:location).permit(:title, :loc_type, :address, :latitude, :longitude)
    .merge(event_id: @event.id)
  end
end
