# frozen_string_literal: true

def token(user)
  AuthenticateUser.call(user.email, user.password).result
end

def header(key, value)
  request.headers[key] = value
end

def login(user)
  header "Authorization", "Bearer #{token(user)}"
end
