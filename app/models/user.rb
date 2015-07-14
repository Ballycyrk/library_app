class User < ActiveRecord::Base
  before_save { email.downcase! }
  VALID_NAME_REGEX = /\A[a-z\s]+[a-z]\z/i
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+[a-z\d]+\.[a-z]+\z/i
  validates :name, presence: true, length: {minimum: 2, maximum: 50},
                   format: { with: VALID_NAME_REGEX }
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  has_secure_password
  validates :password, length: { minimum: 6 }
end
