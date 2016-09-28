class VideosController < ApplicationController

  before_action :set_video, only: [:show, :edit, :update, :destroy]
  before_action :require_user, except: [:index, :show]
  before_action :require_same_user, only: [:edit, :update, :destroy]


  def index
    @videos = Video.all
  end

  def show
  end

  def new
    @video = Video.new
  end

  def create
    @video = Video.new video_params
    if @video.save
      redirect_to video_path(@video), notice: "Video was successfully added"
    else
      render "new", notice: "Unable to add the video. Please check for errors"
    end
  end

  def edit
  end

  def update
    if @video.update video_params
      redirect_to video_path(@video), notice: "Video was successfully modified"
    else
      render "new", notice: "Unable to modify the video. Please check for errors"
    end
  end

  def destroy
    @video.destroy
    redirect_to videos_path
  end

  private

  def video_params
    params.require(:video).permit(:title, :description)
  end

  def set_video
    @video = Video.find(params[:id])
  end

  def require_same_user
    if @video.users.first != current_user
      redirect_to root_path, notice: "You can only edit or delete your own videos"
    end
  end
end
