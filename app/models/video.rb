class Video < ApplicationRecord
  validates :title, presence: true
  has_many :playlist_videos
  has_many :playlists, through: :playlist_videos
  has_many :users, through: :playlists
end
