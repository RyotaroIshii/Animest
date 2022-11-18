class UsersController < ApplicationController
  def show
    @user = current_user
    @users = User.all
  end

  def edit
  end

  def update
  end

  def create
    @user = current_user
    @user.assign_attributes(avatar: params[:user][:avatar])
    @user.save
    redirect_to user_path(current_user)
  end

  def title
  end

  def index
  end

  def avatar
    @user = current_user

  end

  def login
  end

  def logout
  end

  private

  def user_params
    params.require(:user).permit(:name, :image, :avatar)
  end

end
