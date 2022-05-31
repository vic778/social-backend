hash = { message: "Thank you for joining VIC platform" }

json.post do
  json.title "Registration Successful"
  json.merge! hash
end
