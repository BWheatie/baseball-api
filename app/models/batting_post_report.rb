module BattingPostReport
  include BattingReport

  def self.required_attrs
    [:battingpost_games, :battingpost_atbats]
  end

  def self.optional_attrs
    [:battingpost_runs, :battingpost_hits, :battingpost_doubles, :battingpost_triples, :battingpost_homeruns, :battingpost_rbi,
    :battingpost_stolenbases, :battingpost_caughtstealing, :battingpost_walks, :battingpost_strikeouts, :battingpost_intentionalwalks,
    :battingpost_hitbypitch, :battingpost_sacbunts, :battingpost_sacflys, :battingpost_gidp]
  end

  (self.required_attrs + self.optional_attrs).each do |stat|
    define_method(stat) do
      StatHelper.sum_battingpost_stat(@player, stat)
    end
  end

  def avgpost
    self.avg
  end

  def slgpost
    self.slg
  end

  def obppost
    self.obp
  end

  def opspost
    self.slgpost + self.obppost
  end

  def isopost
    self.slgpost - self.avgpost
  end

  def babippost
    self.babip
  end

  def papost
    self.pa
  end

  def tbpost
    self.tb
  end
end