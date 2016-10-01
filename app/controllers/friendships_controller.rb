class FriendshipsController < ApplicationController

  def create
    @friendship = current_user.friendships.new(friend_id: params[:friend_id])
    if @friendship.save
      redirect_to friends_user_path(current_user)
    else
      redirect_to users_path
    end
  end

  def destroy
    @friendship = Friendship.find(params[:id])
    @friendship.destroy
    redirect_to friends_user_path(current_user)
  end

  def accept
    @friendship = Friendship.new(user_id: current_user.id, friend_id: params[:user_id], approved: true)
    @friendship_inverse = Friendship.where(user_id: params[:user_id], friend_id: current_user.id).first
    if @friendship.save
      @friendship_inverse.approved = true
      @friendship_inverse.save
      redirect_to friends_user_path(current_user)
    else
      redirect_to friend_requests_user_path(current_user)
    end
  end

end
