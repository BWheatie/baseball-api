require 'request_helper'

describe PlayersController do
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

  describe 'GET /players/:player_id/report' do
    it 'succeeds for an empty player' do
      player = FactoryGirl.create :player
      get player_report_path(player)
      expect(response).to have_http_status(:success)
      expect(json["data"]['id']).to_not be_nil
    end

    it "supports a batter" do
      batting = FactoryGirl.create :batting_w_required
      get player_report_path(batting.player)
      expect(response).to have_http_status(:success)
      expect(json["data"]["attributes"]["batting"]).to_not be_nil
    end

    it "supports a pitcher" do
      pitching = FactoryGirl.create :pitching_w_required
      get player_report_path(pitching.player)
      expect(response).to have_http_status(:success)
      expect(json["data"]["attributes"]["pitching"]).to_not be_nil
    end

    it "correctly calcs HR" do
      player = FactoryGirl.create :player
      FactoryGirl.create :batting_w_required, player: player, batting_homeruns: 3
      FactoryGirl.create :batting_w_required, player: player, batting_homeruns: 2
      get player_report_path(player)
      expect(response).to have_http_status(:success)
      expect(json["data"]["attributes"]["batting"]["batting_homeruns"]).to eq 5
    end
  end

  describe 'GET /players?q=:query' do
    it 'searches players' do
      FactoryGirl.create_list :player, 2
      player = FactoryGirl.create :player, name_first: "Babe", name_last: "Ruth"
      get players_path(q: "ru")
      expect(response).to have_http_status(:success)
      expect(json["data"].count).to be >= 1
    end
  end

  def json
    JSON.parse(response.body)
  end
end