class User < ApplicationRecord  
  has_many :posts
  has_many :tags, through: :posts
  has_many :playlists
  has_many :videos, through: :playlists

  validates :firstname, presence: true
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true, length: {minimum: 6, maximum: 25}
  validates :date_of_birth, presence: true
  validates :gender, presence: true

  has_secure_password
end
