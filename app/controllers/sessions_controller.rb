class SessionsController < ApplicationController
  def create
    unless request.env['omniauth.auth'][:uid]
      flash[:notice] = '連携に失敗しました'
      redirect_to root_url
    end
    user_data = request.env['omniauth.auth']
    user = User.find_by(uid: user_data[:uid])
    if user
      log_in user
      redirect_to "https://0d48985d451545af975e615bb79ea406.vfs.cloud9.ap-northeast-1.amazonaws.com/user/:id"
    else
      new_user = User.new(
        uid: user_data[:uid],
        nickname: user_data[:info][:nickname],
        name: user_data[:info][:name],
        image: user_data[:info][:image],
      )
      if new_user.save
        log_in new_user
        redirect_to "https://0d48985d451545af975e615bb79ea406.vfs.cloud9.ap-northeast-1.amazonaws.com/user/:id/avatar_select"
      else
        flash[:notice] = '予期せぬエラーが発生しました'
        redirect_to root_url
      end

    end
  end


  def destroy
    log_out if logged_in?
    redirect_to "https://0d48985d451545af975e615bb79ea406.vfs.cloud9.ap-northeast-1.amazonaws.com/logout_page"
  end
end