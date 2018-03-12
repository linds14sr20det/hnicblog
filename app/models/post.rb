class Post < ApplicationRecord
  belongs_to :user
  validates :title, presence: true
  validates :publish_date, presence: true
  validates :body, presence: true

  def first_image
    html = Nokogiri::HTML.fragment(body)
    image = ActionController::Base.helpers.asset_path("hobbynight70.png", :digest => false)
    image = html.css('img')[0].attr('src') unless html.css('img')[0].nil?
    image
  end
end
