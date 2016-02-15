
class GamesController < ApplicationController
    
    before_action :authenticate_user!

    def show
      
        @game = Game.find(params[:id])

      
    end
    
    def index
      
      @games = Game.all
      
    end
    
    def edit
   
        @game = Game.find(params[:id])
    
  
    end
    
    def update
        @game = Game.find(params[:id])
        puts user_params
        if (User.where(:name => user_params[:name]) != [])
          puts "Aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa #{user_params[:name]}"
          @user = User.where(:name => user_params[:name])[0]
        else
          puts "Bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbe #{user_params[:name]}"
          @user = User.new
          @user.name = user_params[:name]
          @user.email = user_params[:address]
          @user.password = "12345678"
          @user.value = 5
          @user.save
        end
        @game.users << @user
        if @game.save
            flash[:success] = "Profile Updated!"
            redirect_to game_path(id: @game.id)
        else
          
          render action: :edit
        
        end
        
    end
  
    private
    
    def user_params
      params.require(:game).permit(:name, :address)
    end
  
    #def only_current_user
    #  @user = User.find( params[:user_id] )
    #  redirect_to(root_url) unless @user == current_user
    #end
    
end

################## Added relation between games and users
################# Users can now join a game