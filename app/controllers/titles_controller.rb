class TitlesController < ApplicationController
  def show
    @title = Title.new
    @titles = Title.all
  end

  private

  def title_params
    params.require(:title).permit(:id, :title)
  end

end
