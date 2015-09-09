class PlayersController < ApplicationController
  def show
    render_json_api Player.find(params[:id])
  end

  def index
    if params[:q]
      render_json_api Player.search(params[:q])
    else
      render_json_api Player.page(params[:page])
    end
  end

  def report
    report = Player.find(params[:player_id]).report
    render json: report, content_type: "application/vnd.api+json"
  end
end