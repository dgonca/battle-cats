class Battle < ApplicationRecord
	has_many :pet_battles
	validates :pet_battles, length: {maximum: 2}

  def has_winner?
    return true if set_winner != nil && set_loser != nil
  end

  def set_winner
    scores = find_scores
    if !pending_battle?
      winner_pet_pb = self.pet_battles[scores.find_index(scores.max)]
      winner_pet_pb.update_attributes(winner: true)
      return winner_pet_pb
    end
  end

  def winner
    if has_winner?
      pet_battle = self.pet_battles.all.select {|petbattle| petbattle.winner == true}
      return pet_battle[0].pet
    end
  end

  def set_loser
    scores = find_scores
    if !pending_battle?
      loser_pet_pb = self.pet_battles[scores.find_index(scores.min)]
      loser_pet_pb.update_attributes(winner: false)
      return loser_pet_pb
    end
  end

  def loser
    if has_winner?
      pet_battle = self.pet_battles.all.select {|petbattle| petbattle.winner == false}
      return pet_battle[0].pet
    end
  end

  def find_scores
    scores = []
    self.pet_battles.all.each do |pb|
      scores << pb.button_score
    end
    scores
  end

  def pending_battle?
    scores = find_scores
    return true if scores.include?(nil)
  end
end
