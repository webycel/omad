class SessionController < ApplicationController

	def new
	end

	def create
		@user = User.find_by("email = :login OR username = :login", :login => params[:session][:email])
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
