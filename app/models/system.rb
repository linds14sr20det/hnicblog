class System < ApplicationRecord
  belongs_to :cohort
  has_one :attachment, inverse_of: :system
  accepts_nested_attributes_for :attachment, reject_if: :all_blank, allow_destroy: true
end
