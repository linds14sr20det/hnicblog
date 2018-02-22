class AddMoreFieldsToSubmission < ActiveRecord::Migration[5.0]
  def change
    add_column :submissions, :project_location, :string
    add_column :submissions, :cisc_number, :integer
    add_column :submissions, :contact_cisc, :boolean, default: false
    add_column :submissions, :steelwork_completion_date, :timestamp
  end
end
