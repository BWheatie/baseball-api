require 'rails_helper'
require 'pry'

RSpec.describe BattingReport, type: :model do
  describe "#bat_formula" do
    it "calculates" do
      player = FactoryGirl.create :player
      pitching = FactoryGirl.create :batting, player: player, H: 12, AB: 10
      report = BattingReport.new(player)
      expect(report.AVG).to eq(1.2)
    end
  end
end