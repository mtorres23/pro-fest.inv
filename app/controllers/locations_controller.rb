class LocationsController < ApplicationController
  before_action :set_client
  before_action :set_event
  before_action :set_location, only: [:show, :edit, :update, :destroy]

  def index
    @locations = @event.locations.all
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
        format.html { redirect_to event_location_path(event_id: @location.event_id, id: @location.id), notice: 'Location was successfully updated.' }
        format.json { render :show, status: :ok, location: @location }
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
