module Types
  class MutationType < Types::BaseObject
    field :sign_up, mutation: Mutations::CreateUser
    field :login, mutation: Mutations::LoginUser
    field :create_wx_setting, mutation: Mutations::CreateWxSetting
  end
end
