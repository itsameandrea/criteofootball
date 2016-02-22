class PagesController < ApplicationController
    
    before_action :authenticate_user!
    before_filter :just_admin, only: :dashboard

    
    def home
        
        @game = Game.last
        @users = User.all
        
    end
    
    def dashboard
        
    end
    
    private
    
    def just_admin
        unless current_user.email == "andrea.rocca3@gmail.com"
            redirect_to root_url
        end
    end
        
    
end
