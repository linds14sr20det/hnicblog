class Category < ApplicationRecord
  belongs_to :cohort
  has_many :submission_categories
end
