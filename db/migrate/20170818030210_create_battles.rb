class CreateBattles < ActiveRecord::Migration[5.1]
  def change
    create_table :battles do |t|
    
      t.timestamps
    end
  end
end
