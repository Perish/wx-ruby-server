class WxSetting < ApplicationRecord
  belongs_to :user

  validates :app_id, presence: true, uniqueness: true
  validates :app_secret, presence: true, uniqueness: true

  before_create :generate_token
  def generate_token
    begin
      self.token = Digest::SHA1.hexdigest(SecureRandom.urlsafe_base64)
    end while self.class.exists?(token: self.token)
  end
end
