class UsersController < ApplicationController
  def show
    @user = current_user
    @users = User.all
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    @user.update(user_params)
    redirect_to user_path(current_user.uid)
  end

  def create
    @user = current_user
    @user.assign_attributes(avatar: params[:user][:avatar])
    @user.save
    redirect_to user_path(current_user.uid)
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
    params.require(:user).permit(:id, :uid, :name, :avatar, :title, :description)
  end

  def title_params
    params.require(:title).permit(:title_id, :title)

  end

end
