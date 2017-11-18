class CreateRoles < ActiveRecord::Migration[5.0]
  def change
    create_table :roles do |t|
      t.integer :role, default: 0
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
