class PlayersController < ApplicationController
  def show
    render_json_api Player.find(params[:id])
  end

  def index
    render_json_api Player.all
  end

  def career
    render_json_api Player.find(params[:player_id])
  end
end