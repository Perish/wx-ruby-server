module Types
  class QueryType < Types::BaseObject
    field :users, [Types::UserType], null: true
    
    def users
      User.all
    end
  end
end
