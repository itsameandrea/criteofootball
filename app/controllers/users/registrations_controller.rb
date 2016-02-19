class Users::RegistrationsController < Devise::RegistrationsController
  
  
  def create
    super do |resource|
      resource.name = user_params[:name]
      resource.role_id = Role.where(:name => user_params[:role_id])[0].id
      resource.value = 5
      resource.save
      GameMailer.user_email(resource.name, resource.email, resource.password)
    end
  end
  
  private
    
    def user_params
      params.require(:user).permit(:name, :role_id)
    end

    
  
end