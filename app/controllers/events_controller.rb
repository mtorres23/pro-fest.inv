class EventsController < ApplicationController
  before_action :set_account
  before_action :set_customer, only: [:events_by_customer, :new_customer_event, :create_customer_event]
  before_action :set_event, only: [:show, :edit, :update, :destroy]

  # GET /events
  # GET /events.json
  def index
    @events = current_user.account.events
  end

  def events_by_customer
    @events = @customer.events
  end

  def new_customer_event
    @event = @customer.events.new
  end

  # GET /events/1
  # GET /events/1.json
  def show
    @locations = @event.locations.where(hidden: nil)
  end

  # GET /events/new
  def new
    @event = @account.events.new
  end

  # GET /events/1/edit
  def edit
  end

  # POST /events
  # POST /events.json
  def create
    @event = @account.events.new(event_params)

    respond_to do |format|
      if @event.save
        format.html { redirect_to account_event_path(@account, @event), notice: 'Event was successfully created.' }
        format.json { render :show, status: :created, location: @event }
        @event.locations.new(title: 'Truck', latitude: @event.latitude, longitude: @event.longitude, event_id: @event.id, loc_type: 'truck').save
        @event.locations.new(title: 'sales', latitude: @event.latitude, longitude: @event.longitude, event_id: @event.id, loc_type: 'sales', hidden: true).save
        @event.locations.new(title: 'waste', latitude: @event.latitude, longitude: @event.longitude, event_id: @event.id, loc_type: 'waste', hidden: true).save
        @event.locations.new(title: 'comps', latitude: @event.latitude, longitude: @event.longitude, event_id: @event.id, loc_type: 'comps', hidden: true).save
      else
        format.html { render :new }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # POST /accounts/account_id/customers/:id/events
  def create_customer_event
    @event = @customer.events.new(customer_event_params)

    respond_to do |format|
      if @event.save
        format.html { redirect_to account_event_path(@account, @event), notice: 'Event was successfully created.' }
        format.json { render :show, status: :created, location: @event }
        @event.locations.new(title: 'HQ', latitude: @event.latitude, longitude: @event.longitude, event_id: @event.id, loc_type: 'compound').save
      else
        format.html { render :new }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /events/1
  # PATCH/PUT /events/1.json
  def update
    @event = @account.events.find(params[:id])

    respond_to do |format|
      if @event.update_attributes(event_params)
        format.html { redirect_to @event, notice: 'Event was successfully updated.' }
        format.json { render :show, status: :ok, location: @event }
      else
        format.html { render :edit }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
   @event = @account.events.find(params[:id])
    @event.destroy
    respond_to do |format|
      format.html { redirect_to events_url, notice: 'Event was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = @account.events.find(params[:id])
    end

    def set_account
      @account = Account.find(current_user.account_id)
    end

    def set_customer
      @customer = Customer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def event_params
      return params.require(:event)
      .permit(:title, :start_date, :end_date, :address, :latitude, :longitude, :admin_id, :customer_id, :photo_url)
      .merge(account_id: @account.id)
    end

    def customer_event_params
      return params.require(:event)
      .permit(:title, :start_date, :end_date, :address, :latitude, :longitude, :admin_id, :customer_id, :photo_url)
      .merge(account_id: @account.id, customer_id: @customer.id)
    end
end
