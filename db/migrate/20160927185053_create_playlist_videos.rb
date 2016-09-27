class CreatePlaylistVideos < ActiveRecord::Migration[5.0]
  def change
    create_table :playlist_videos do |t|
      t.integer :playlist_id, foreign_key: true
      t.integer :video_id, foreign_key: true
      t.timestamps
    end
  end
end
