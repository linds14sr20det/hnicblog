class Post < ApplicationRecord
  has_many :users, inverse_of: :post, dependent: :destroy
  has_many :attachments, inverse_of: :post, dependent: :destroy
  #TODO: validate start is before end
  accepts_nested_attributes_for :attachments, reject_if: :all_blank, allow_destroy: true
end
