class SessionController < ApplicationController

	before_action :current_user

	def new
	end

	def create
		@user = User.find_by_email(params[:session][:email])
		if @user && @user.authenticate(params[:session][:password])
			session[:user_id] = @user.id
			redirect_to '/'
		else
			@errors = "error"
			render 'new'
		end
	end

	def destroy
		session[:user_id] = nil
		redirect_to '/login'
	end

end
