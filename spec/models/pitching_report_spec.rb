require 'rails_helper'
require 'pry'

RSpec.describe PitchingReport, type: :model do
  describe "#pitch_formula" do
    it "calculates" do
      player = FactoryGirl.create :player
      pitching = FactoryGirl.create :pitching, player: player, H: 12, BB: 10

      report = PitchingReport.new(player)
      expect(report).to receive(:ip).and_return(3)
      expect(report.WHIP).to be_within(0.01).of(7.33)
    end
  end
end