json.extract! announcement, :id, :title, :body, :date, :created_at, :updated_at
json.url announcement_url(announcement, format: :json)
