class PostsController < ApplicationController

  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :require_user, except: [:index, :show]
  before_action :require_same_user, only: [:edit, :update, :destroy]

  def index
    @posts = Post.all.order('created_at DESC')
  end

  def show
  end

  def new
    @post = current_user.posts.new
  end



  def create
    @post = current_user.posts.new post_params
    if @post.save
      redirect_to post_path(@post), notice: "Your post was successfully added"
    else
      render "new", notice: "Errors are prohibiting your post being added"
    end
  end

  def edit
  end

  def update
    if @post.update post_params
      redirect_to post_path(@post), notice: "Your post was successfully updated"
    else
      render "edit", notice: "Errors are prohibiting your post being updated"
    end
  end

  def destroy
    @post.destroy
    redirect_to posts_path
  end

  private

  def post_params
    params.require(:post).permit(:title, :content, tag_ids: [])
  end

  def set_post
    @post = Post.find(params[:id])
  end

  def require_same_user
    if current_user != @post.user
      redirect_to root_path, notice: "You can only edit or delete your own post"
    end
  end

end