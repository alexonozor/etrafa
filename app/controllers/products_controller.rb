class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy, :send_inquiry]

  # GET /products
  # GET /products.json
  def index
    @products = Product.all
  end

  # GET /products/1
  # GET /products/1.json
  def show
  end

  # GET /products/new
  def new
    @product = Product.new
    @categories = Category.roots
  end

  # GET /products/1/edit
  def edit
  end

  # POST /products
  # POST /products.json
  def create
   
    params["product"]["category_ids"] = params["product"]["category_ids"].join('').split(',')
    @product = Product.new(product_params)
    @product.user_id = current_user.id if current_user.present?
    respond_to do |format|
      if @product.save
        format.html { redirect_to @product, notice: 'Product was successfully created.' }
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
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to @product, notice: 'Product was successfully updated.' }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  def send_inquiry
    @quantity_types = [['Pieces', 'pieces'], ['Bags', 'bags'], ['Boxes', 'boxes'], ['Foot', 'foot'], ['Meters', 'meters'], ['Yards', 'yards']]
  end

  def post_inquiry
    product_owner = User.find(params[:product_owner])
    product = Product.find(params[:product_id])
    inquiry = { 
                email: params[:email], 
                quantity: params[:quantity], 
                quantity_type: params[:quantity_types],
                extra_request: params[:extra_request] 
              }
    ContactSuppliyerMailer.send_inquiry(inquiry, product, product_owner).deliver_now
    respond_to do |format|
      format.html { redirect_to :back, notice: 'Inquiry sent!' }
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to products_url, notice: 'Product was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params.require(:product).permit(:title, { :category_ids => [] },  :place_of_origin, :size, :price, :packings, :description, :features,  pictures: []  )
    end
end
