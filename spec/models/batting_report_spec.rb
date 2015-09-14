require 'rails_helper'

RSpec.describe BattingReport, type: :model do
  describe "#sum_batting_stat" do
    it "calculates" do
      player = FactoryGirl.create :player
      batting = FactoryGirl.create :batting, player: player, batting_hits: 12, atbats: 10

      report = Report.new(player)
      expect(report.avg).to eq(1.2)
    end
  end
end