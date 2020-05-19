class ApplicationController < ActionController::Base
	before_action :configure_permitted_parameres, if: :devise_controller?

	protect_from_forgery with: :exception

	private

	def configure_permitted_parameters
		devise_parameter_sanitizer.permit(:sign_up, keys: [name])
	end

	def after_sign_in_path_for(resources)
		
	end

	def after_sign_out_path_for(resources)
		root_path
	end
end
