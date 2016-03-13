class UsersController < ApplicationController
  
  before_action :only_admin, :except => [:show]

    
  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.find(params[:id])
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
  end

  # POST /users
  # POST /users.json
  def create

    @user = User.new
    
    @user.name = user_params[:name]
    @user.role_id = Role.where(:name => user_params[:role_id])[0].id
    @user.email = user_params[:email]
    @user.value = 5
    @user.goal = 0
    @user.password = "criteo123"
    if @user.save
      GameMailer.user_email(@user.name, @user.email, @user.password)
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    
    @user = User.find(params[:id])
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

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user = User.find(params[:id])
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private


    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:name, :email, :goal, :role_id)
    end
    
    def only_admin
      
      redirect_to(root_url) unless current_user.email == "andrea.rocca3@gmail.com"
    end
    
end