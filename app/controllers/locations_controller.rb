class LocationsController < ApplicationController
  before_action :set_client
  before_action :set_event
  before_action :set_location, only: [:location_json, :show, :edit, :update, :destroy]

  def index
    @locations = @event.locations.all
  end
# GET api/events/:event_id/locations
  def index_as_json
    @locations = @event.locations.all
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

  def new
    puts @event
    puts params[:event_id]
    @event = @client.events.find(params[:event_id])
    @location = @event.locations.new
  end

  def create
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



 # PATCH/PUT /locations/1
  # PATCH/PUT /locations/1.json
  def update
    @location = @event.locations.find(params[:id])

    respond_to do |format|
      if @location.update_attributes(location_params)
        puts "This is what is firing"
        #format.html { redirect_to event_locations_path(event_id: @location.event_id, id: @location.id), notice: 'Location was successfully updated.' }
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

  def set_client
    @client = Client.find(current_user.client_id)
  end

  def set_event
      @event = @client.events.find(params[:event_id])
  end

  def set_location
      @location = @event.locations.find(params[:id])
  end

  def location_params
    return params.require(:location).permit(:title, :loc_type, :address, :latitude, :longitude)
  end
end
