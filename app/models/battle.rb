class Battle < ApplicationRecord
	has_many :pet_battles
	validates :pet_battles, length: {maximum: 2}
end
