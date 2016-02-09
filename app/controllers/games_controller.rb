
class GamesController < ApplicationController
    
    before_action :authenticate_user!

    def show
      
        @game = Game.find(params[:id])

      
    end
    
    def edit
   
        @game = Game.find(params[:id])
    
    end
    
    def update
        @game = Game.find(params[:id])
        puts user_params
        if (User.where(name: user_params) != nil)
          puts "Aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
          @user = User.where(name: user_params)
        else
          puts "Bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb"
          @user = User.new
          @user.name = user_params
          @user.email = user_params.to_s.split[0].split("")[0] + "." + user_params.to_s.split[1] + "@criteo.com"
          @user.password = user_params.to_s.split[0] + user_params.to_s.split[1] + "12345"
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
      params.require(:game).permit(:name)
    end
  
    #def only_current_user
    #  @user = User.find( params[:user_id] )
    #  redirect_to(root_url) unless @user == current_user
    #end
    
end

