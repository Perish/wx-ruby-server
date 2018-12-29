module Types
  class UserAttributes < Types::BaseInputObject
    description "注册用户需要填写的内容"
    argument :username, String, "用户名", required: true
    argument :email, String, "邮箱", required: true
    argument :password, String, "密码", required: true
    argument :password_confirmation, String, "密码确认", required: true
  end
end