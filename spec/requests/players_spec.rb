require 'request_helper'

describe PlayersController do
  describe 'GET /players/:player_id/career' do
    player = FactoryGirl.create :player
    get player_career_path(player)
    expect(response).to have_http_status(:success)
  end
end