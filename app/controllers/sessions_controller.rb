class SessionsController < ApplicationController
	def new
		@user = User.new
	end

	def create
		@user = User.find_by(email: session_params[:email])
		if @user && @user.authenticate(session_params[:password])
			session[:user_id] = @user.id
			redirect_to user_path(@user)
		else
			render 'new'
		end
	end

	def destroy
		if logged_in?
			session.delete(:user_id)
			redirect_to root
		else
			redirect_to root
		end
	end

	private

		def session_params
			params.require(:session).permit(:email, :password)
		end
end