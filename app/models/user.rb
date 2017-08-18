class User < ApplicationRecord
	has_many :pets, foreign_key: :owner_id
	has_secure_password

	validates :email, :password, presence: true
	validates :email, uniqueness: true
end
