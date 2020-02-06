class AccountsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_account, only: [:dashboard, :show, :edit, :update, :users, :items]
  before_action :redirect_unless_admin, except: [:dashboard, :users, :products]

  def dashboard
    @orders = @account.orders
    @locations = @account.locations
    @events = @account.events
    @items = @account.items
  end

# GET /accounts/:id/users
  def users
    @users = @account.users
  end

# GET /accounts/:id/products
  def products
    @items = @account.products
  end

  # GET /accounts/new
  def new
    @account = Account.new
  end

  # GET /accounts/1/edit
  def edit
  end

  # POST /accounts
  # POST /accounts.json
  def create
    @account = current_user.account.new(account_params)

    respond_to do |format|
      if @account.save
        format.html { redirect_to @account, notice: 'Account was successfully created.' }
        format.json { render :show, status: :created, location: @account }
      else
        format.html { render :new }
        format.json { render json: @account.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /accounts/1
  # PATCH/PUT /accounts/1.json
  def update
    @account = current_user.account

    respond_to do |format|
      if @account.update_attributes(account_params)
        format.html { redirect_to @account, notice: 'Event was successfully updated.' }
        format.json { render :show, status: :ok, location: @account }
      else
        format.html { render :edit }
        format.json { render json: @account.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.

    def set_account
      @account = Account.find(current_user.account_id)
    end

    def redirect_unless_admin
      puts current_user.permission_level
      unless user_signed_in? && current_user.permission_level === 2
        redirect_to :dashboard
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def account_params
      return params.require(:account)
      .permit(:company_id, :account_access_key, :address, :latitude, :longitude)
      .merge(:admin_id => current_user.id)
    end
end
