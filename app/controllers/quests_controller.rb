class QuestsController < ApplicationController
  
  def show
    if session[:title].nil?
    # ランダムなタイトルを生成
      @title = result.data.search_works.edges.to_a.sample.node.title
    # セッションにタイトルを保存
      session[:title] = @title
    else
    # セッションからタイトルを読み込む
      @title = session[:title]
    end
    @user = current_user
  end

  def change_title
    @user = current_user
  # 新しいランダムなタイトルを生成
    new_title = result.data.search_works.edges.to_a.sample.node.title
  # セッションに新しいタイトルを保存
    session[:title] = new_title

    redirect_to quest_path
  end

  # def change
  #   @user = current_user
  #   if  @quest.change_count == nil
  #     @quest = Quest.new
  #     @quest.change_count += 1
  #     @quest.save
  #     redirect_to quest_path
  #   elsif not @quest.change_count == nil
  #     @quest = Quest.find(params[:id])
  #     @quest.change_count += 1
  #     @quest.update(quest_params)
  #     redirect_to quest_path
  #   end
  # end

  def update
    @user = current_user
    @user.acquisition_point += 10
    @user.save
    new_title = result.data.search_works.edges.to_a.sample.node.title
    session[:title] = new_title
    redirect_to complete_path
  end

  def complete
    @user = current_user
  end


  private

  def quest_params
    params.require(:quest).permit(:id, :user_id, :change_count)
  end

  def user_params
    params.require(:user).permit(:uid, :name, :image, :avatar, :acquisition_point)
  end

  def result
    response = Animest::Client.query(Query)
  end

end
