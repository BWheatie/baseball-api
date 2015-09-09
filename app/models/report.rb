class Report
  extend ActiveModel::Naming
  include ActiveModel::Serialization
  include AppearancesReport
  include BattingReport
  include BattingPostReport
  include PitchingPostReport
  include FieldingReport
  include FieldingPostReport
  include PitchingReport
  include PitchingPostReport

  attr_reader :player

  def initialize player
    @player = player
  end

  def id
    SecureRandom.uuid
  end

  def batter?
    has_attrs?(BattingReport.required_attrs)
  end

  def pitcher?
    has_attrs?(PitchingReport.required_pitching_attrs)
  end

  def fielder?
    has_attrs?(FieldingReport.required_fielding_attrs)
  end

  def post_batter?
    has_attrs?(required_batting_post_attrs)
  end

  def post_pitcher?
    has_attrs?(required_pitching_post_attrs)
  end

  def post_fielder?
    has_attrs?(required_fielder_post_attrs)
  end

  def appears?
    has_attrs?(AppearancesReport.required_appearances_attrs)
  end

  private

  def has_attrs?(attrs)
    attrs.each do |a|
      return false if self.send(a) == nil
    end
    true
  end
end