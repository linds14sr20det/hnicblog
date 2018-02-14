class AddActiveToCohort < ActiveRecord::Migration[5.0]
  def change
    add_column :cohort, :active, :boolean, default: false
  end
end
