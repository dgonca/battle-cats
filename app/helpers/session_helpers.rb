module SessionsHelper

	def session_id
		session[:user_id]
	end
	def current_user
		if session_id
			current_user ||= User.find(session_id)
		end
	end

	def logged_in?
		session_id != nil
	end

	def authenticate!
		redirect_to "/404" unless logged_in?
	end
end