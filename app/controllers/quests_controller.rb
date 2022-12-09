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
    ,"2022-winter","2022-spring","2022-summer","2022-autumn"]) {
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
    @quests = result.data.search_works.edges
    @user = current_user
  end

  def update
    @user = current_user
    @user.acquisition_point += 10
    @user.save
    redirect_to complete_path
  end

  def complete
  end

  private

  def quest_params
    params.require(:quest).permit(:user_id, :change_count, )
  end

  def user_params
    params.require(:user).permit(:id, :uid, :name, :image, :avatar, :acquisition_point)
  end

  def result
    response = Animest::Client.query(Query)
  end
end
