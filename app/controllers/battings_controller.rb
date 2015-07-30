class BattingsController < ApplicationController
  def index
    @battings = Batting.page params[:page]
    render_json_api @battings
  end

  def show
    @batting = Batting.find(params[:id])
    render_json_api @batting
  end
end
