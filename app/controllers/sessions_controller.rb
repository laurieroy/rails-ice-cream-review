class SessionsController < ApplicationController
	def welcome
	end

	def new 
	end

	def create
		@user = User.find_by(username: params[:user][:username])

		if @user.try(:authenticate, params[:user][:password])
			session[:user_id] = @user.id
			flash[:notice] = "Logged in successfully" # haven't implemented flash yet
			redirect_to @user
		else
			flash.now[:error] = "Something was wrong with your login details. Please try again."
			redirect_to login_path
		end
	end

	def destroy
		session.delete(:user_id)
		flash[:notice] = "Logged out"
		redirect_to root_path
	end

	def omniauth
		@user = User.create_google_oa(auth)
	
		session[:user_id] = @user.id
		redirect_to @user
	end


	private

	def auth
		#see byebug if request.env or what
		request.credentials['omniauth.auth']
	end

end
