class User < ApplicationRecord
  validates :firstname, presence: true
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true, length: {minimum: 6, maximum: 25}
  validates :date_of_birth, presence: true
  validates :gender, presence: true

  has_secure_password
end
