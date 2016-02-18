class Users::RegistrationsController < Devise::RegistrationsController
  
  
  def create
    super do |resource|
      resource.name = user_params[:name]
      resource.role_id = Role.where(:name => user_params[:role_id])[0].id
      resource.save
    end
  end
  
  private
    
    def user_params
      params.require(:user).permit(:name, :role_id)
    end

    
  
end