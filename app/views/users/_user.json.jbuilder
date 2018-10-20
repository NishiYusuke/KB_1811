json.extract! user, :id, :name, :room_id, :attachment, :created_at, :updated_at
json.url user_url(user, format: :json)
