class SessionsController < ApplicationController
  def new

  end

  def create
    @user = User.where(email: params[:session][:email]).first
    if @user && @user.authenticate(params[:session][:password])
      @authorized_user = @user
      session[:user_id] = @authorized_user.id
      redirect_to root_path, notice: "You are successfully logged in"
    else
      render 'new', notice: "Incorrect credentials. Please check again"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: "You are successfully logged out"
  end
end
