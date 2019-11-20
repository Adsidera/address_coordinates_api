# frozen_string_literal: true

def token(user)
  AuthenticateUser.call(user.email, user.password).result
end