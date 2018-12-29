module Types
  class UserType < Types::BaseObject
    field :email, String, null: true
    field :username, String, null: true
  end
end
