class Cohort < ApplicationRecord
  has_many :submissions
  has_many :categories, inverse_of: :cohort
  #TODO: validate start is before end
  accepts_nested_attributes_for :categories, reject_if: :all_blank, allow_destroy: true
end
