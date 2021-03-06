class UsersController < ApplicationController

	before_action :require_user, only: [:search]

	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)
		if @user.save
			session[:user_id] = @user.id
			redirect_to '/'
		else
			render 'new'
		end
	end

	def search
		@users = User.allExcept(params[:search], @current_user.id)
	end

	private
		def user_params
			params.require(:user).permit(:username, :email, :password)
		end

end
