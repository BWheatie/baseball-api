class PlayersController < ApplicationController
  def show
    render_json_api Player.find(params[:id].split(','))
  end

  def index
    if params[:q]
      render_json_api Player.search(params[:q]).page(params[:page])
    else
      render_json_api Player.page(params[:page])
    end
  end

  def report
    render_json_api Player.find(params[:player_id]).report
  end
end