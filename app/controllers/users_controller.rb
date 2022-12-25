class UsersController < ApplicationController
  def show
    @user = User.find_by(uid: params[:uid])
    @users = User.all
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update(user_params)
    redirect_to user_path(current_user.uid)
    else
    render :edit
    end
  end

  def create
    @user = current_user
    @user.assign_attributes(avatar: params[:user][:avatar])
    @user.save
    redirect_to user_path(current_user.uid)
  end

  def rank
    @users = User.page(params[:page]).per(10)
  end

  def index
  end

  def avatar
    @user = current_user
  end

  private

  def user_params
    params.require(:user).permit(:uid, :name, :avatar, :title, :description, :acquisition_point)
  end

end
