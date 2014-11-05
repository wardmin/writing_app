class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy, :settings, :profile, :calendar]
  # before_filter :require_no_authentication, only: :create
  respond_to :html, :json
  # GET /users
  # GET /users.json
  # def index
  #   @users = User.all
  # end

  # GET /users/1
  # GET /users/1.json
  def show
    # respond_to do |format|
    #   if @user.update(user_params)
    #     format.html { redirect_to @user, notice: 'User was successfully updated.' }
    #     format.json { respond_with_bip(@user) }
    #     # format.json { render :show, status: :ok, location: @user }
    #   else
    #     format.html { render :edit }
    #     format.json { respond_with_bip(@user) }
    #     # format.json { render json: @user.errors, status: :unprocessable_entity }
    #   end
    # end
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

    respond_to do |format|
      if @user.save
        format.html { redirect_to sign_in @user, :flash => { success: 'Your account has been successfully created. Please check your email to verify your account.'} }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def calendar
    respond_to do |format|
      format.js
    end
  end

  def settings
    respond_to do |format|
      format.html
      format.js
    end
  end

  def profile
    respond_to do |format|
      format.html
      format.js
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, :flash => { success: 'User was successfully updated.'} }
        format.json { respond_with_bip(@user) }
        # format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { respond_with_bip(@user) }
        # format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
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
      params.require(:user).permit(:name, :email, :location, :genre_id, :desired_amount, :desired_interval, :track_hours, :tag_list)
    end
end
