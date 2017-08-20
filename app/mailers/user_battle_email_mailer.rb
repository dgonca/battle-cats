class UserBattleEmailMailer < ApplicationMailer
	def notify_user(user)
		@user = user
		mail(to: @user.email, subject: "Battle")
	end

	def join_battle(opponent)
		@opponent = opponent
		mail(to: @opponent.email, subject: You are in a battle)
	end
end
