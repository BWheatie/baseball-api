require 'rails_helper'

RSpec.describe FieldingReport, type: :model do
  describe "#sum_fielding_stat" do
    it "calculates" do
      player = FactoryGirl.create :player
      fielding = FactoryGirl.create :fielding, player: player, :fielding_putouts 3, :fielding_assists 5, :fielding_errors 1

      report = Report.new(player)
      expect(report.fp).to eq(8/9)
    end
  end
end