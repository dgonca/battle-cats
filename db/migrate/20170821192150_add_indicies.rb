class AddIndicies < ActiveRecord::Migration[5.1]
  def change
    add_index :pets, :owner_id
    add_index :pet_battles, :pet_id
    add_index :pet_battles, :battle_id
  end
end
