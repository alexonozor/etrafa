class PostingSourcesController < ApplicationController
  before_action :set_posting_source, only: [:show, :edit, :update, :destroy]
  before_action :autenticate_user!

  # GET /posting_sources
  # GET /posting_sources.json
  def index
    @posting_sources = PostingSource.all
  end

  # GET /posting_sources/1
  # GET /posting_sources/1.json
  def show
    
  end

  # GET /posting_sources/new
  def new
    @quantity_types = [['Pieces', 'pieces'], ['Bags', 'bags'], ['Boxes', 'boxes'], ['Foot', 'foot'], ['Meters', 'meters'], ['Yards', 'yards']]
    @posting_source = PostingSource.new
  end

  # GET /posting_sources/1/edit
  def edit
  end

  # POST /posting_sources
  # POST /posting_sources.json
  def create
    params["posting_source"]["category_ids"] = params["posting_source"]["category_ids"].join('').split(',') unless params["posting_source"]["category_ids"]
    @posting_source = PostingSource.new(posting_source_params)
    @posting_source.user_id = current_user.id if current_user.present?
    respond_to do |format|
      if @posting_source.save
        format.html { redirect_to @posting_source, notice: 'Posting source was successfully created.' }
        format.json { render :show, status: :created, location: @posting_source }
      else
        format.html { render :new }
        format.json { render json: @posting_source.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posting_sources/1
  # PATCH/PUT /posting_sources/1.json
  def update
    respond_to do |format|
      if @posting_source.update(posting_source_params)
        format.html { redirect_to @posting_source, notice: 'Posting source was successfully updated.' }
        format.json { render :show, status: :ok, location: @posting_source }
      else
        format.html { render :edit }
        format.json { render json: @posting_source.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posting_sources/1
  # DELETE /posting_sources/1.json
  def destroy
    @posting_source.destroy
    respond_to do |format|
      format.html { redirect_to posting_sources_url, notice: 'Posting source was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_posting_source
      @posting_source = PostingSource.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def posting_source_params
      params.require(:posting_source).permit({ :category_ids => [] },  :name, :description, :purchase_quantity, :quantity_type, :valid_to, :user_id)
    end
end
