class AnimesController < ApplicationController
  
  def index
    @animes = result.data.search_works.edges.map(&:node)
    @animes = Kaminari.paginate_array(@animes).page(params[:page]).per(100)
  end

  def year
  end

  private

  def result
    response = Animest::Client.query(Query)
  end

end
