require 'rails_helper'

RSpec.describe PitchingReport, type: :model do
  describe "#sum_pitching_stat" do
    it "calculates" do
      player = FactoryGirl.create :player
      pitching = FactoryGirl.create :pitching, player: player, pitching_hits: 12, pitching_walks: 10

      report = Report.new(player)
      expect(report).to receive(:ip).and_return(3)
      expect(report.whip).to be_within(0.01).of(7.33)
    end
  end
end
