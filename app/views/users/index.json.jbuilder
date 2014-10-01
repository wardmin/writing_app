json.array!(@users) do |user|
  json.extract! user, :id, :name, :email, :location, :genre_id, :desired_amount, :desired_interval
  json.url user_url(user, format: :json)
end
