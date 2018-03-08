class AddCohortToSystems < ActiveRecord::Migration[5.0]
  def change
    add_reference :systems, :cohort, index: true
    add_foreign_key :systems, :cohorts
  end
end

