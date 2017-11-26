class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  layout "suppliyer", only: [:suppliyer_panel]

  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  def account
    @buyer = current_user if current_user.present?
    render 'users/buyers/account'
  end
 
  def suppliyer_panel
    render 'users/suppliyers/suppliyer_panel'
  end
   
  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)
    @user.suppliyer! if params['user']['account_type'] == "suppliyer"
    @user.buyer!     if params['user']['account_type'] == "buyer"
    respond_to do |format|
      if @user.save
        session[:user_id] = @user.id #keep user session
        @company = Company.create(user_id: @user.id, name: params['user']['company_name'])
        if @user.suppliyer?
          # binding.pry
          format.html { redirect_to supliyer_panel_users_path, notice: 'User was successfully created.' }
          format.json { render :show, status: :created, location: @user }
        else
          format.html { redirect_to root_url, notice: 'User was successfully created.' }
          format.json { render :show, status: :created, location: @user }
        end
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def request_qoutation
    render 'users/buyers/request_qoutation'
  end

  def manage_received_quotations
    render 'users/buyers/manage_received_quotations'
  end

  def manage_sent_quotations
    render 'users/buyers/manage_sent_quotations'
  end

  def buyer_profile
    render 'users/buyers/buyer_profile'
  end

  

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:first_name, :last_name, :password, :password_confirmation, :email, :account_type, :phone_number, :company_name, :title, :job_title, :country, :state, :city, :category_id, :member_id, :avatar, :street)
    end
end
