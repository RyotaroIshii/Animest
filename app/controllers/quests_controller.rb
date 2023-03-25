class QuestsController < ApplicationController
  Query = Animest::Client.parse <<-GRAPHQL
  query {
    searchWorks(seasons:
    ["2010-winter","2010-spring","2010-summer","2010-autumn"
    ,"2011-winter","2011-spring","2011-summer","2011-autumn"
    ,"2012-winter","2012-spring","2012-summer","2012-autumn"
    ,"2013-winter","2013-spring","2013-summer","2013-autumn"
    ,"2014-winter","2014-spring","2014-summer","2014-autumn"
    ,"2015-winter","2015-spring","2015-summer","2015-autumn"
    ,"2016-winter","2016-spring","2016-summer","2016-autumn"
    ,"2017-winter","2017-spring","2017-summer","2017-autumn"
    ,"2018-winter","2018-spring","2018-summer","2018-autumn"
    ,"2019-winter","2019-spring","2019-summer","2019-autumn"
    ,"2020-winter","2020-spring","2020-summer","2020-autumn"
    ,"2021-winter","2021-spring","2021-summer","2021-autumn"
    ,"2022-winter","2022-spring","2022-summer","2022-autumn"
    ,"2023-winter"]) {
    edges {
      node {
        title
        seasonYear
      }
    }
  }
}
  GRAPHQL




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
  # ページをリダイレクト
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
