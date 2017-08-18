class User < ApplicationRecord
	has_many :pets, foreign_key: :owner_id
	has_secure_password
end
