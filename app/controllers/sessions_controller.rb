class SessionsController < ApplicationController

	def index
		print session[:user_id]
	end

	def login

		if user = User.find_by(email: params[:email])
			if current_user = user.authenticate(params[:password])
				session[:user_id] = user.id
				redirect_to root_url
			else
				flash.now[:error] = "Password is incorrect"
				render :index
			end
		else
			flash.now[:error] = "Email is incorrect"
			render :index
		end
	end

end
