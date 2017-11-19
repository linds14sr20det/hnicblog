class Submission < ApplicationRecord
  belongs_to :cohort
  belongs_to :user
end
