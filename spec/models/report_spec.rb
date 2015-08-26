require 'rails_helper'
require 'pry'

RSpec.describe Report, type: :model do
  describe "#BA" do
    it "calculates" do
      player = Player.create
      Batting.create(H: 5, AB: 25, player: player)
      Batting.create(H: 10, AB: 20, player: player)
      report = Report.new(player)
      expect(report.BA).to eq(15/45.0)
    end
  end

end