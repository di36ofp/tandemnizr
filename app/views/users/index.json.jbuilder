json.array!(@users) do |user|
  json.extract! user, :id, :name, :email, :password, :nationality, :city, :cp, :age, :career, :photo, :description
  json.url user_url(user, format: :json)
end
