class WxSetting < ApplicationRecord
  belongs_to :user

  validates :app_id, presence: true, uniqueness: true
  validates :app_secret, presence: true, uniqueness: true
end
