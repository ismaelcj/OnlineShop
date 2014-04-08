class SessionsController < ApplicationController

	def index
	end

	def login

		if user = User.find_by(email: params[:email])
			if current_user = user.authenticate(params[:password])
				flash[:notice] = "logged in"
				render '/orders'
			else
				flash.now[:notice] = "Password is incorrect"
			end
		else
			flash.now[:notice] = "Email is incorrect"
		end

		render :index
	end

end
