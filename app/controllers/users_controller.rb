class UsersController < ApplicationController

	def new
		@user = User.new
		render 'new'
	end

	def create
		@user = User.new(user_params)
		if @user.save
			session[:user_id] = @user.id
			render 'show'
		else
			render 'new'
		end
	end

	def show

	end


private
	def user_params
		params.require(:user).permit(:password, :password_confirmation, :email)
	end
end