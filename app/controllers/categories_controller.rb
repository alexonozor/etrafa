class CategoriesController < ApplicationController
  before_action :set_category, only: [:show, :edit, :update, :destroy, :select_category_children]

  # GET /categories
  # GET /categories.json
  def index
    @categories = Category.all
  end

  # GET /categories/1
  # GET /categories/1.json
  def show
    @category_products = @category.products
  end

  # GET /categories/new
  def new
    @categories = Category.roots
  end

  # GET /categories/1/edit
  def edit
    @categories = @category.children
  end

  # POST /categories
  # POST /categories.json
  def create
    @category = Category.new(category_params)

    respond_to do |format|
      if @category.save
        params["category"]["sub_category"].each do |category|
        if category["name"] != "" || category["description"] != ""
          @child_category =  Category.new(category_params(category))
            @child_category.parent = @category
            @child_category.save!  
        end
      end
        format.html { redirect_to @category, notice: 'Category was successfully created.' }
        format.json { render :show, status: :created, location: @category }
      else
        format.html { render :new }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /categories/1
  # PATCH/PUT /categories/1.json
  def update
    respond_to do |format|
      if @category.update(category_params)
        format.html { redirect_to @category, notice: 'Category was successfully updated.' }
        format.json { render :show, status: :ok, location: @category }
      else
        format.html { render :edit }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /categories/1
  # DELETE /categories/1.json
  def destroy
    @category.destroy
    respond_to do |format|
      format.html { redirect_to categories_url, notice: 'Category was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def category_products
    @child_category = Category.find(params["child_category"])
    @parent_category = Category.find(params["parent_category"])
    @child_category_products = Category.find(params["child_category"]).products
  end

  def select_category_children
    @sub_category = params[:sub_category]
    if @category.has_children?
      @categories = @category.children
    end
  end
  

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_category
      @category = Category.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def category_params
      params.require(:category).permit(:name, :description, :picture, :banner)
    end
end



