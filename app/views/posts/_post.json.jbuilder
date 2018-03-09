json.extract! post, :id, :publish_date, :title, :body, :created_at, :updated_at
json.url post_url(post, format: :json)