class ApplicationController < ActionController::Base
	# Prevent CSRF attacks by raising an exception.
	# For APIs, you may want to use :null_session instead.
	protect_from_forgery with: :exception

	add_flash_types :error

	def current_user
		@current_user ||= User.find(session[:user_id]) if session[:user_id]
	end
	helper_method :current_user

	def authenticate_user!
		unless current_user
			redirect_to new_session_url, :error => "You need logging in to see this site."
		end
	end

	def only_not_logged_in_user!
		if current_user
			redirect_to root_url, :notice => "You are already logged."
		end
	end
end