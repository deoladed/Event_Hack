class ApplicationController < ActionController::Base
	before_action :configure_permitted_parameters, if: :devise_controller?

 protected

 def configure_permitted_parameters
   devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :description])
 end

 	def authenticate_admin
		unless current_user.is_admin
			flash[:danger] = "Degage t'as rien a foutre la"
			redirect_to root_url 
		end
	end
end
