class SessionsController < ApplicationController

	def index
		puts "\n********** index **********\n"

		# reset_session
		puts "session[:user_id]: #{session[:user_id]}"
		puts "session[:login]: #{session[:login]}"
		if session[:login]
			flash[:notice] = "Ya estás logeado"
			redirect_to root_url
		end

		puts "\n\n********** ***** **********\n"
	end

	def login
		puts "\n********** login **********"

		if user = User.find_by(email: params[:email])
			puts "email correct"
			if current_user = user.authenticate(params[:password])
				puts "password correct"
				session[:user_id] = user.id
				session[:user_name] = user.name
				session[:user_lastname] = user.last_name
				session[:login] = true
				redirect_to root_url
			else
				puts "password incorrect"
				flash.now[:error] = "Password is incorrect"
				render :index
			end
		else
			puts "email incorrect"
			flash.now[:error] = "Email is incorrect"
			render :index
		end

		puts "********** ***** **********\n"
	end

	def logout
		flash.now[:error] = "TO DO: logout"
		render :index
	end

end
