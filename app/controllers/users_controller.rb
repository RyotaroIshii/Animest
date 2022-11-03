class UsersController < ApplicationController
  def show
    @user = current_user
  end

  def edit
  end

  def update
  end

  def create
    @user = current_user
    if User.save
      redirect_to user_path(current_user)
    else
      render :avatar
      flash[:notice] = '正常に更新されませんでした、もう一度選択してください。'
    end
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
    params.require(:user).permit(:uid, :avatar)
  end

end
