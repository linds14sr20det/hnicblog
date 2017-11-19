class CreateSubmissions < ActiveRecord::Migration[5.0]
  def change
    create_table :submissions do |t|
      t.references :cohort
      t.references :user
      t.string :description
      t.string :name
      t.boolean :submitted
      t.timestamps
    end
  end
end
