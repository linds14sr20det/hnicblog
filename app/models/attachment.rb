class Attachment < ApplicationRecord
  belongs_to :submission, optional: true
end
