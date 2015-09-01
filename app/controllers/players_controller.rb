class PlayersController < ApplicationController
  def show
    render_json_api Player.find(params[:id])
  end

  def index
    if Player.where(params[:query])
      return render_json_api
    else Player.page(params[:page])
      return render_json_api
    end
  end

  def report
    render_json_api Player.find(params[:player_id]).report
  end

end