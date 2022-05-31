json.user do
  json.call(current_user, :id, :email, :name, :profile, :bio)
end
