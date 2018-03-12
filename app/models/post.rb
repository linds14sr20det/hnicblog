class Post < ApplicationRecord
  belongs_to :user
  has_many :attachments, inverse_of: :post, dependent: :destroy
  #TODO: validate start is before end
  accepts_nested_attributes_for :attachments, reject_if: :all_blank, allow_destroy: true

  def first_image
    html = Nokogiri::HTML.fragment(body)
    image = ActionController::Base.helpers.asset_path("hobbynight70.png", :digest => false)
    image = html.css('img')[0].attr('src') unless html.css('img')[0].nil?
    image
  end
end
