require 'rails_helper'
require 'pry'

RSpec.describe AppearancesReport, type: :model do
  describe "#appearances" do
    it "calculates" do
      player = FactoryGirl.create :player
      pitching = FactoryGirl.create :batting, player: player, H: 12, AB: 10
      report = BattingReport.new(player)
      expect(report.AVG).to eq(1.2)
    end
  end
end