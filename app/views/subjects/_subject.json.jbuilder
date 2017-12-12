json.extract! subject, :id, :title, :description, :created_at, :updated_at
json.url subject_url(subject, format: :json)
