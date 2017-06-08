json.extract! event_to_user, :id, :event_id, :user_id, :created_at, :updated_at
json.url event_to_user_url(event_to_user, format: :json)
