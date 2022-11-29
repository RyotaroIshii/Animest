class UsersController < ApplicationController
  def show
    @user = current_user
    @users = User.all
    @titles = Title.all
  end

  def edit
  end

  def update
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
    params.require(:user).permit(:id, :uid, :name, :avatar)
  end

  def title_params
    params.require(:title).permit(:title_id, :title)

  end

end
