class PetBattle < ApplicationRecord
	belongs_to :pet
	belongs_to :battle
  # belongs_to :user, through: :pet, source: :owner

  # def isWinner?
  #   if
  # end
end
