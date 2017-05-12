class ClientsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_client, only: [:dashboard, :show, :edit, :update, :users, :items]
  before_action :redirect_unless_admin, except: [:dashboard, :users, :items]

  def dashboard
    @orders = @client.orders
    @locations = @client.locations
    @events = @client.events
    @items = @client.items
  end

# GET /clients/:id/users
  def users
    @users = @client.users
  end

# GET /clients/:id/items
  def items
    @items = @client.items
  end

  # GET /clients/new
  def new
    @client = Client.new
  end

  # GET /clients/1/edit
  def edit
  end

  # POST /clients
  # POST /clients.json
  def create
    @client = current_user.clients.new(client_params)

    respond_to do |format|
      if @client.save
        format.html { redirect_to @client, notice: 'Event was successfully created.' }
        format.json { render :show, status: :created, location: @client }
      else
        format.html { render :new }
        format.json { render json: @client.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /clients/1
  # PATCH/PUT /clients/1.json
  def update
    @client = current_user.clients.find(params[:id])

    respond_to do |format|
      if @client.update_attributes(client_params)
        format.html { redirect_to @client, notice: 'Event was successfully updated.' }
        format.json { render :show, status: :ok, location: @client }
      else
        format.html { render :edit }
        format.json { render json: @client.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.

    def set_client
      @client = Client.find(current_user.client_id)
    end
    
    def redirect_unless_admin
      unless user_signed_in? && current_user.id === current_user.client.admin_id
        redirect_to :dashboard
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def client_params
      return params.require(:client)
      .permit(:company_id, :access_key, :address, :latitude, :longitude)
      .merge(:admin_id => current_user.id)
    end
end
