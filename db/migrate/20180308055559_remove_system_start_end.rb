class RemoveSystemStartEnd < ActiveRecord::Migration[5.0]
  def change
    remove_column :systems, :start_at
    remove_column :systems, :end_at
    add_column :systems, :date_description, :string

    add_column :cohorts, :date_description, :string
  end
end
