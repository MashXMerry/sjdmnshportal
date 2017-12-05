json.extract! student, :id, :firstname, :lastname, :password, :lrn, :section, :level, :gender, :email, :created_at, :updated_at
json.url student_url(student, format: :json)
