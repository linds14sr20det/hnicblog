class AddCohortToCategories < ActiveRecord::Migration[5.0]
  def change
    add_reference :categories, :cohort, index: true
    add_foreign_key :categories, :cohorts
  end
end

