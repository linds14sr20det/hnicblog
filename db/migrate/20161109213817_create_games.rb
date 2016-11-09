class CreateGames < ActiveRecord::Migration[5.0]
  def change
    create_table :games do |t|
      t.integer :attacker
      t.integer :defender
      t.integer :winner
      t.integer :location

      t.timestamps
    end
  end
end
