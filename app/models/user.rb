class User < ApplicationRecord
  validates :email, uniqueness: true, presence: true
  validates :api_key, uniqueness: true, presence: true
  validates :password_digest, presence: true
  validates :password_confirmation, presence: true

  has_secure_password

  def self.find_user(api_key)
    self.where(api_key: api_key)
  end
end
