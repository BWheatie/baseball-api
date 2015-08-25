require 'request_helper'

describe PlayersController do
  describe 'GET /players/:player_id/career' do
    it 'succeeds' do
      player = FactoryGirl.create :player
      get player_career_path(player)
      expect(response).to have_http_status(:success)
    end
  end
  describe 'GET /players' do
    it 'has 1 page of players' do
      FactoryGirl.create_list :player, 50
      get players_path
      expect(response).to have_http_status(:success)
    end
  end
  describe 'GET /players/:player_id' do
    it 'succeeds' do
      player = FactoryGirl.create :player
      get player_path(player)
      expect(response).to have_http_status(:success)
    end
  end
end