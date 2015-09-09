require 'rails_helper'
require 'pry'

RSpec.describe BattingReport, type: :model do
  describe "#sum_batting_stat" do
    it "calculates" do
      player = FactoryGirl.create :player
      batting = FactoryGirl.create :batting, player: player, H: 12, AB: 10

      report = Report.new(player)
      expect(report.AVG).to eq(1.2)
    end
  end
end