json.extract! progress, :id, :category, :description, :expected_days, :complete, :created_at, :updated_at
json.url progress_url(progress, format: :json)
