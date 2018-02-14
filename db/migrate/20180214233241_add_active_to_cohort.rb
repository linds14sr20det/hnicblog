class AddActiveToCohort < ActiveRecord::Migration[5.0]
  def change
    add_column :cohorts, :active, :boolean, default: false
  end
end
