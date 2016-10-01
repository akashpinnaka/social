class UsersController < ApplicationController

  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def index
    @users = User.all
  end

  def show

  end

  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
    if @user.save
      redirect_to user_path(@user), notice: "Your account is created successfully"
    else
      render 'new', notice: "Please check for the errors and enter again"
    end
  end

  def edit
  end

  def update
    if @user.update user_params
      redirect_to user_path(@user), notice: "Your profile was successfully updated"
    else
      render "edit", notice: "Errors are prohibiting to update your profile"
    end
  end

  def destroy
    @user.destroy
    redirect_to root_path, notice: "Account was successfully deleted"
  end

  def friends
    @friends = current_user.friends
  end

  def friend_requests
    @friendships_as_friend = Friendship.all.where(friend_id: current_user.id, approved: false)
  end

  def pending_requests
    @pending = Friendship.all.where(user_id: current_user.id, approved: false)
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:firstname, :lastname, :email, :date_of_birth, :gender, :password, :password_confirmation)
  end
end
