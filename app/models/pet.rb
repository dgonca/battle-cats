class Pet < ApplicationRecord
	has_many :pet_battles
	has_many :battles, through: :pet_battles
	belongs_to :owner, class_name: "User"
	
end
