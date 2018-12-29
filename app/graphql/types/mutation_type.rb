module Types
  class MutationType < Types::BaseObject
    field :signUp, mutation: Mutations::CreateUser
    field :login, mutation: Mutations::LoginUser
  end
end
