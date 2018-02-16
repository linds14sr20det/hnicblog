class Submission < ApplicationRecord
  belongs_to :cohort
  belongs_to :user
  has_many :team_members
  has_many :attachments, dependent: :destroy
  accepts_nested_attributes_for :attachments, :allow_destroy => true
end
