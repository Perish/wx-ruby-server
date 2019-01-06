module Types
  class QueryType < Types::BaseObject
    field :users, [Types::UserType], null: true
    field :current_user, Types::UserType, null: true

    def current_user
      Rails.logger.info "current_user -----  #{context[:current_user]}"
      context[:current_user]
    end
    
    def users
      User.all
    end
  end
end
