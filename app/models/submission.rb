class Submission < ApplicationRecord
  belongs_to :cohort
  belongs_to :user
  has_many :team_members, inverse_of: :submission, dependent: :destroy
  has_many :attachments, inverse_of: :submission, dependent: :destroy
  accepts_nested_attributes_for :attachments, allow_destroy: true
  accepts_nested_attributes_for :team_members, reject_if: :all_blank, allow_destroy: true
end
