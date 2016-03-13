
class GamesController < ApplicationController
    
    before_action :authenticate_user!
    before_action :only_admin, :except => [:show, :useroptout, :useroptin]
    
    def new
      
      @game = Game.new
      
    end
    
    def create
      
      @game = Game.new(game_params)
      if @game.save
        flash[:success] = "Game created!"
        redirect_to dashboard_path
      else
        render action: :new
      end
      
    end

    def show
      
        game = Game.find(params[:id])
        
        @players = game.users.uniq

      
    end
    
    def destroy
      @game = Game.find(params[:id])
      @game.destroy
      respond_to do |format|
        format.html { redirect_to games_url, notice: 'User was successfully deleted.' }
      end
    end
    
    def index
      
      @games = Game.all
      
      
    end
    
    def edit
   
        @game = Game.find(params[:id])
  
    end
    
    def useroptout
      
      @game = Game.find(params[:game_id])
      
      if params[:user]
          @game.users.delete(User.find(params[:user]))
          flash[:success] = "Hope to see you next time!"
          GameMailer.optout_user_email(User.find(params[:user]).name, User.find(params[:user]).email)
          redirect_to root_path
      end
      
    end
    
    def useroptin
      
      @game = Game.find(params[:game_id])
      @user = User.find(params[:user])
      @game.users << @user
      
      name = @user.name
      address = @game.address
      time = @game.time
      email = @user.email

      if @game.save
        GameMailer.game_email(name, address, time, email).deliver
        flash[:success] = "Thanks for joining!"
        redirect_to root_path
      end
      
    end
    
    def update
        @game = Game.find(params[:id])
        
        if @game.update(game_params)
          flash[:success] = "Game Updated!"
          redirect_to dashboard_path
        else
          render action :edit
        end
    end
  
    private
    
    def user_params
      params.require(:game).permit(:name, :address)
    end
    
    def game_params
      params.require(:game).permit(:name, :address, :time)
    end
    
    def only_admin
      
      redirect_to(root_url) unless current_user.email == "andrea.rocca3@gmail.com"
    end
    #def only_current_user
    #  @user = User.find( params[:user_id] )
    #  redirect_to(root_url) unless @user == current_user
    #end
    
end
