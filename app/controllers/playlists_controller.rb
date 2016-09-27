class PlaylistsController < ApplicationController

  before_action :set_playlist, only: [:show, :edit, :update, :destroy]
  before_action :require_user, except: [:index, :show]
  before_action :require_same_user, only: [:edit, :update, :destroy]

  def index
    @playlists = Playlist.all
  end

  def show
  end

  def new
    @playlist = current_user.playlists.new
  end

  def create
    @playlist = current_user.playlists.new playlist_params
    if @playlist.save
      redirect_to playlist_path(@playlist.id), notice: "Playlist was successfully created"
    else
      render "new", "Unable to create the playlist. Please check for errors"
    end
  end

  def edit
  end

  def update
    if @playlist.update playlist_params
      redirect_to playlist_path(@playlist), notice: "Playlist was successfully updated"
    else
      render "edit", "Unable to update the playlist. Please check for errors"
    end
  end

  def destroy
    @playlist.destroy
    redirect_to playlists_path
  end

  private

  def set_playlist
    @playlist = Playlist.find(params[:id])
  end

  def playlist_params
    params.require(:playlist).permit(:name, :description)
  end

  def require_same_user
    if current_user != @playlist.user
      redirect_to root_path, notice: "You can only edit or delete your playlists"
    end
  end
end
