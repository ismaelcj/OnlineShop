class SessionsController < ApplicationController
	before_action :only_not_logged_in_user!, except: :destroy

	def new
	end

	def create
		puts "\n********** login **********"

		if user = User.find_by(email: params[:email])
			puts "email correct"
			if user.authenticate(params[:password])
				puts "password correct"
				session[:user_id] = user.id
				redirect_to root_url, :notice => "You are now logged in!"
			else
				puts "password incorrect"
				flash.now[:error] = "Password is incorrect"
				render :new
			end
		else
			puts "email incorrect"
			flash.now[:error] = "Email is incorrect"
			render :new
		end

		puts "********** ***** **********\n"
	end

	def destroy
		puts "********** destroy **********"
		session[:user_id] = nil
		redirect_to root_url, :notice => "Logged out!"

		puts "********** ******* **********"
	end

end
