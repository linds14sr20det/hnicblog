class SubmissionCategory < ApplicationRecord
  belongs_to :submission
  belongs_to :category
  after_save { |s_c| s_c.destroy if s_c.description.blank? }
end