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
      redirect_to user_path(current_user.uid)
    else
      new_user = User.new(
        uid: user_data[:uid],
        nickname: user_data[:info][:nickname],
        name: user_data[:info][:name],
        image: user_data[:info][:image],
        description: user_data[:info][:description],
      )
      if new_user.save
        log_in new_user
        redirect_to avatar_path(current_user.uid)
      else
        flash[:notice] = '予期せぬエラーが発生しました'
        redirect_to root_url
      end

    end
  end


  def destroy
    log_out if logged_in?
    redirect_to logout_page_path
  end
end