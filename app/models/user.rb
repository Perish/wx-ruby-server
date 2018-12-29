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
    "#{id}$#{SecureRandom.hex(30)}$#{SecureRandom.base64(20)}"
  end
end
