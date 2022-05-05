class UsersController < ApplicationController
  before_action :authenticate_user!
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @rooms = @user.rooms
  end

  def modify
    @user = User.find(current_user.id)
  end

  def profile
    @user = User.find(current_user.id)
    @user.image.attach(params[:user][:image])
    @user.update(user_params)
    redirect_to user_path(@user)
  end

  private

  def user_params
    params.require(:user).permit(:introduction, :image)
  end
end
