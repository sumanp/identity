json.extract! detail, :id, :title, :age, :phone, :email, :person_id, :created_at, :updated_at
json.url detail_url(detail, format: :json)
