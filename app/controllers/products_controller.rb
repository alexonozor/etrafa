class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy, :send_inquiry]
  layout "suppliyer", only: [:suppliyer_panel_products, :suppliyer_panel_company, 
                             :suppliyer_panel_product, :new, :saved_products, :submitted_products]
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
    params["product"]["category_ids"] = params["product"]["category_ids"].join('').split(',') unless params["product"]["category_ids"]
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

  def saved_products
    @saved_products = Product.saved_products(current_user) if current_user_is_a_suppliyer?
    render 'users/suppliyers/saved_products'
  end

  def submitted_products
    @submitted_products = Product.submitted_products(current_user) if current_user_is_a_suppliyer?
    render 'users/suppliyers/submitted_products'
  end

  def current_user_is_a_suppliyer?
    return true if current_user && current_user.suppliyer?
    return false
  end

  def suppliyer_panel_company_edit
    
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

  def suppliyer_panel_product
    render 'users/suppliyers/suppliyer_panel_product'
  end

  def suppliyer_panel_products
    @suppliyer_product = current_user.products
    @product = Product.new
    render 'users/suppliyers/suppliyer_panel_products'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params.require(:product).permit(:title, 
                                      { :category_ids => [] },  
                                      :place_of_origin, 
                                      :size, 
                                      :hot,
                                      :price,
                                      :sponsored,
                                      :packings, 
                                      :description,
                                      :features, 
                                      :model_number,
                                      :primary_picture,
                                      :key_word,
                                      :minimum_order_quantity,
                                      :unit_of_measure,
                                      :fob_price_base_on_quantity,
                                      :fob_quantity,
                                      :fob_unit,
                                      :single_fob_price_range,
                                      :fob_minimum_price_range,
                                      :fob_minimum_price,
                                      :fob_maximum_price,
                                      :consignment_weight,
                                      :weight_unit,
                                      :order_leading_start_time,
                                      :order_leading_end_time,
                                      :payment_method_id,
                                      :sample_availability,
                                      :sample_policy,
                                      :sample_cost,
                                      :choose_not_disclose,
                                      :brand_name,
                                      :country,
                                      :state_of_origin,
                                      :submit_for_review,
                                       pictures: []  )
    end
end

    # t.string   "title"
    # t.string   "place_of_origin"
    # t.string   "size"
    # t.text     "packings"
    # t.text     "description"
    # t.text     "features"
    # t.datetime "created_at",                                 null: false
    # t.datetime "updated_at",                                 null: false
    # t.json     "pictures"
    # t.integer  "user_id"
    # t.decimal  "price",                      default: "0.0"
    # t.boolean  "sponsored",                  default: false
    # t.boolean  "hot",                        default: false
    # t.string   "model_number"
    # t.string   "primary_picture"
    # t.string   "key_word"
    # t.integer  "minimum_order_quantity"
    # t.string   "unit_of_measure"
    # t.integer  "fob_price_base_on_quantity"
    # t.integer  "fob_quantity"
    # t.string   "fob_unit"
    # t.boolean  "single_fob_price_range"
    # t.decimal  "fob_minimum_price_range"
    # t.decimal  "fob_minimum_price"
    # t.decimal  "fob_maximum_price"
    # t.integer  "consignment_weight"
    # t.integer  "weight_unit"
    # t.date     "order_leading_start_time"
    # t.date     "order_leading_end_time"
    # t.integer  "payment_method_id"
    # t.boolean  "sample_availability"
    # t.string   "sample_policy"
    # t.decimal  "sample_cost"
    # t.boolean  "choose_not_disclose"
    # t.string   "brand_name"
    # t.string   "country"
    # t.string   "state_of_origin"