class User < ApplicationRecord
	has_many :pets, foreign_key: :owner_id
	has_many :votes
	has_secure_password

	validates :email, :password, presence: true
	validates :email, uniqueness: true


	def user_name
		name = self.email[/[^@]+/]
	end
end


