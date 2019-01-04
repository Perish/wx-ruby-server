class User < ApplicationRecord
  has_secure_password

  validates :username, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true

  before_validation :downcase_username_and_email
  def downcase_username_and_email
    self.username = username.to_s.downcase.strip
    self.email = email.to_s.downcase.strip
  end

  def generate_token
    crypt = ActiveSupport::MessageEncryptor.new(Rails.application.credentials.secret_key_base.byteslice(0..31))
    token = crypt.encrypt_and_sign("user_ident:#{self.id}")
  end

  def self.authenticate_by_token(token)
    crypt = ActiveSupport::MessageEncryptor.new(Rails.application.credentials.secret_key_base.byteslice(0..31))
    token = crypt.decrypt_and_verify(token)
    user_id = token.gsub('user_ident:', '').to_i
    User.find_by id: user_id
  rescue ActiveSupport::MessageVerifier::InvalidSignature
    nil
  end
end
