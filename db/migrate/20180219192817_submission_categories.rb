class SubmissionCategories < ActiveRecord::Migration[5.0]
  def change
    create_table :submission_categories do |t|
      t.string :description
      t.belongs_to :category, foreign_key: true
      t.belongs_to :submission, foreign_key: true
      t.timestamps
    end
  end
end
