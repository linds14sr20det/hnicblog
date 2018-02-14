json.extract! submission, :id, :name, :description, :created_at, :updated_at
json.url submission_url(submission, format: :json)