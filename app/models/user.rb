class User < ApplicationRecord
  has_secure_password
  
  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
  validates :email, presence: true, uniqueness: { case_sensitive: false }, format: { with: EMAIL_REGEX }
  validates :first_name, :last_name, :username, length: { minimum: 2 }
  validates :dob, presence: true
end
