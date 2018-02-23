class AddBriefDescriptionToSubmission < ActiveRecord::Migration[5.0]
  def change
    add_column :submissions, :brief_description, :string
  end
end
