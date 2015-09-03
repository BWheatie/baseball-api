require 'request_helper'

describe PlayersController do
  # describe 'GET /players' do
  #   it 'has 1 page of players' do
  #     FactoryGirl.create_list :player, 50
  #     get players_path
  #     expect(response).to have_http_status(:success)
  #   end
  # end
  # describe 'GET /players/:player_id' do
  #   it 'succeeds' do
  #     player = FactoryGirl.create :player
  #     get player_path(player)
  #     expect(response).to have_http_status(:success)
  #   end
  # end

  describe 'GET /players?q=:query' do
    it 'searches players' do
      FactoryGirl.create_list :player, 25
      player = FactoryGirl.create :player, name_first: "Babe", name_last: "Ruth"
      get players_path(q: "ru")
      expect(response).to have_http_status(:success)
      expect(json["data"].count).to eq 1
    end
  end

  def json
    JSON.parse(response.body)
  end
end