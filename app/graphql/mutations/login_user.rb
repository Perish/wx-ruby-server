module Mutations
  class LoginUser < Mutations::BaseMutation
    argument :login, String, required: true
    argument :password, String, required: true

    field :errors, String, null: true
    field :token, String, null: false

    def resolve(login:, password:)
      att = login.to_s.downcase.strip
      user = if att.match(/@/)
                User.find_by(email: att)
              else
                User.find_by(username: att)
              end
      if user && user.authenticate(password)
        {
          token: user.generate_token,
          errors: nil 
        }
      else
        {
          token: "",
          errors: "用户名或密码不正确"
        }
      end
    end
  end
end