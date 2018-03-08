class CreateSystems < ActiveRecord::Migration[5.0]
  def change
    create_table :systems do |t|
      t.string :title
      t.string :description
      t.integer :max_players
      t.timestamp :start_at
      t.timestamp :end_at

      t.timestamps
    end
  end
end
