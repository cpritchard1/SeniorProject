class Users::RegistrationsController < Devise::RegistrationsController
	# before_filter :configure_permitted_parameters

  	# protected

  	# 	def configure_permitted_parameters
   #  		devise_parameter_sanitizer.for(:sign_up).push(:fname, :lname, :username, :phone, :admin, :rgroup, :rlab)
  	# 	end

  	private

	def sign_up_params
		params.require(:user).permit(:email, :password, :fname, :lname, :username, :phone, :admin, :rgroup, :rlab)
  	end
end