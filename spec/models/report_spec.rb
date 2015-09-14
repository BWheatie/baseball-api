require 'rails_helper'

RSpec.describe Report do
  describe "#has_attrs?" do
    it "returns true for someone who has bat" do
      batting = FactoryGirl.create :batting_w_required
      report = Report.new(batting.player)
      batter = report.has_attrs?(BattingReport.required_attrs, :battings)
      expect(batter).to be_truthy
    end

    it "returns false for a non-batter" do
      report = Report.new(FactoryGirl.create :player)
      batter = report.has_attrs?(BattingReport.required_attrs, :battings)
      expect(batter).to be_falsey
    end
  end
end