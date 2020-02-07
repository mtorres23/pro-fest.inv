class ProductsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_account

  def index
    @products = @account.products
  end


  def show
  	@product = @account.products.find(params[:id])
  end

  # GET /products/new
  def new
    @product = @account.products.new
  end

  # GET /products/:product_id/edit
  def edit
    @product = @account.products.find(params[:id])
  end

  # POST /products
  # POST /products.json
  def create
    @product = @account.products.new(product_params)

    respond_to do |format|
      if @product.save
        format.html { redirect_to account_product_path(id: @product.id), notice: 'Product was successfully added.' }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
  def update
    @product = @account.products.find(params[:id])

    respond_to do |format|
      if @product.update_attributes(product_params)
        format.html { redirect_to account_product_path(id: @product.id), notice: 'Product was successfully updated.' }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
   @product = @account.products.find(params[:id])
    @product.destroy
    respond_to do |format|
      format.html { redirect_to account_products_url, notice: 'Product was successfully removed from Inventory.' }
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
      redirect_to home_pages_home_path
    end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      return params.require(:product)
      .permit(:name, :upc, :description, :color, :size, :dimensions, :weight, :highest_recorded_price, :lowest_recorded_price, :image_url, :brand, :model_number, :asin, :measure, :unit, :unit_per_item, :width, :length, :height)
      .merge(account_id: @account.id)
    end
end
