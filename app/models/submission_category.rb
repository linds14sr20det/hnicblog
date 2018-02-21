class SubmissionCategory < ApplicationRecord
  belongs_to :submission
  belongs_to :category
end