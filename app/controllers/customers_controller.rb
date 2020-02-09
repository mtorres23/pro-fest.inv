class CustomersController < ApplicationController
    before_action :authenticate_user!
    before_action :set_account, except: [:customer_index]
    before_action :set_customer, only: [:edit, :update]
    before_action :redirect_unless_admin


    # GET /customers
    def customer_index
        @customers = Customer.all
    end

    # GET /accounts/:id/customers
    def index
        @customers = @account.customers
    end
    # GET /accounts/:id/customers/new
    def new
      @customer = @account.customers.new
    end

    # GET accounts/:id/customers/1/edit
    def edit
    end

    # POST /customers
    # POST /customers.json
    def create
      @customer = Customer.new(customer_params)

      respond_to do |format|
        if @customer.save
          format.html { redirect_to @customer, notice: 'Customer was successfully created.' }
          format.json { render :show, status: :created, location: @customer }
        else
          format.html { render :new }
          format.json { render json: @customer.errors, status: :unprocessable_entity }
        end
      end
    end

    # PATCH/PUT /customers/1
    # PATCH/PUT /customers/1.json
    def update

      respond_to do |format|
        if @customer.update_attributes(customer_params)
          format.html { redirect_to @customer, notice: 'Customer was successfully updated.' }
          format.json { render :show, status: :ok, location: @customer }
        else
          format.html { render :edit }
          format.json { render json: @customer.errors, status: :unprocessable_entity }
        end
      end
    end

    private
      # Use callbacks to share common setup or constraints between actions.

      def set_account
        @account = Account.find(params[:account_id])
      end

      def set_customer
        @customer = @account.customers(params[:id])
      end

      def redirect_unless_admin
        puts current_user.permission_level
        unless user_signed_in? && current_user.permission_level > 1
          redirect_to :events
        end
      end

      # Never trust parameters from the scary internet, only allow the white list through.
      def customer_params
        return params.require(:customer)
        .permit(:name, :phone, :email, :address, :latitude, :longitude)
        .merge(:account_id => @account.id)
      end
  end
