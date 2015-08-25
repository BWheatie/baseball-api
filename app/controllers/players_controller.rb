class PlayersController < ApplicationController
  def show
    render_json_api Player.find(params[:id])
  end

  def index
    render_json_api Player.page(params[:page])
  end

  def career
    render_json_api Player.find(params[:player_id])
  end

  def batting
    render_json_api Batting.find_by(player_id: params[:player_id])
  end

  def pitching
    render_json_api Pitching.find_by(player_id: params[:player_id])
  end

  def fielding
    render_json_api Fielding.find_by(player_id: params[:player_id])
  end

  def appearance
    render_json_api Appearance.find_by(player_id: params[:player_id])
  end
end