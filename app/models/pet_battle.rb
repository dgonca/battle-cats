class PetBattle < ApplicationRecord
	belongs_to :pet
	belongs_to :battle
end
