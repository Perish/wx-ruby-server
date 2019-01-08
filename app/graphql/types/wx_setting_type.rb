module Types
  class WxSettingType < Types::BaseObject
    field :app_id, String, null: true
    field :app_secret, String, null: true
    field :token, String, null: true
    field :user, Types::UserType, null: true
  end
end