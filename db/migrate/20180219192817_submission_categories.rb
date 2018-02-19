class SubmissionCategories < ActiveRecord::Migration[5.0]
  def change
    create_table :submission_categories do |t|
      t.string :description
      t.references :categories, foreign_key: true
      t.timestamps
    end
  end
end
