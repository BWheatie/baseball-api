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
    @cache = {}
    @player = player
  end

  def id
    SecureRandom.uuid
  end

  def batter?
    has_attrs?(BattingReport.required_attrs, :battings)
  end

  def pitcher?
    has_attrs?(PitchingReport.required_attrs, :pitchings)
  end

  def fielder?
    has_attrs?(FieldingReport.required_attrs, :fieldings)
  end

  def post_batter?
    has_attrs?(BattingPostReport.required_attrs, :battingposts)
  end

  def post_pitcher?
    has_attrs?(PitchingPostReport.required_attrs, :pitchingposts)
  end

  def post_fielder?
    has_attrs?(FieldingPostReport.required_attrs, :fieldingposts)
  end

  def appears?
    has_attrs?(AppearancesReport.required_attrs, :appearances)
  end

  def has_attrs?(attrs, property)
    self.player.send(property).each do |obj|
      attrs.each {|a| next obj if obj.send(a) == nil}
      return true
    end
    false
  end
end