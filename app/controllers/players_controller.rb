class PlayersController < ApplicationController
  def show
    render_json_api Player.find(params[:id])
  end

  def index
    if params[:query]
      render_json_api Player.search.page(params[:query])
    else
      render_json_api Player.page(params[:page])
    end
  end

  def report
    render_json_api Player.find(params[:player_id]).report
  end

end