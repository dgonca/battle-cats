class UsersController < ApplicationController
	before_action :set_user, only: [:show, :edit, :update, :destroy]
	include SessionsHelper
	
	def new
		@user = User.new
		render 'new'
	end

	def create
		@user = User.new(user_params)
		if @user.save
			UserBattleEmailMailer.notify_user(@user).deliver
			session[:user_id] = @user.id
			redirect_to user_path(@user)
		else
			render 'new'
		end
	end

	def show
		authenticate!
		if logged_in? && current_user.id == params[:id]
			@user = User.find_by(id: params[:id])
		end
	end

	def update
	authenticate!
	@user = User.find_by(email: params[:email])
	p params
		if @user && @user.authenticate(params[:password])
			if passwords_match?
				current_user.update_attributes(user_params)
				render "show"
			else
				@user = User.new
				render "edit"
			end
		else
			@user = User.new
			render 'new'
		end
	end

	def destroy
		authenticate!
		@user.destroy
		session.delete(:user_id)
    	respond_to do |format|
      		format.html { redirect_to root_path, notice: 'User was successfully destroyed.' }
		end
	end

	def verify
		authenticate!
		@user = User.find_by(id: params[:id])
		render "verify"
	end


private

	def set_user
		@user = User.find(params[:id])
	end

	def user_params
		params.require(:user).permit(:password, :password_confirmation, :new_password, :email)
	end

	def passwords_match?
		if params[:password] == params[:password_confirmation]
			params[:user][:password] = params[:user][:password_confirmation]
		else
			@user = User.find_by(id: params[:user][:id])
			render "edit"
		end
	end
end