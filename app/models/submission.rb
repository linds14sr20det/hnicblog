class Submission < ApplicationRecord
  belongs_to :cohort
  belongs_to :user
  has_many :team_members
end
