module Mutations
  class CreateWxSetting < Mutations::BaseMutation
    argument :app_id, String, required: true
    argument :app_secret, String, required: true
    
    field :wx_setting, Types::WxSettingType, null: true
    field :errors, String, null: false

    def resolve(app_id:, app_secret:)
      Rails.logger.info "app_id: #{app_id}"
      Rails.logger.info "app_secret: #{app_secret}"
      raise GraphQL::ExecutionError, "您没权限操作" if context[:current_user].blank?
      user = context[:current_user]
      wx_setting = user.wx_setting || user.build_wx_setting
      wx_setting.app_id = app_id
      wx_setting.app_secret = app_secret
      Rails.logger.info "wx_setting: #{wx_setting.inspect}"
      if wx_setting.save
        {
          wx_setting: wx_setting,
          errors: ""
        }
      else
        {
          wx_setting: nil,
          errors: wx_setting.errors.messages.to_json.to_s
        }
      end
    end
  end
end