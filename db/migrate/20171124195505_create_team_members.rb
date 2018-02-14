class CreateTeamMembers < ActiveRecord::Migration[5.0]
  def change
    create_table :team_members do |t|
      t.string :email
      t.string :name
      t.string :title
      t.references :submission, foreign_key: true

      t.timestamps
    end
  end
end
