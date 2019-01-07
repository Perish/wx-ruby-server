module Types
  class QueryType < Types::BaseObject
    field :users, [Types::UserType], null: true
    field :current_user, Types::UserType, null: true
    field :wx_setting, Types::WxSettingType, null: true

    def current_user
      context[:current_user]
    end

    def wx_setting
      context[:current_user]&.wx_setting
    end
    
    def users
      User.all
    end
  end
end
