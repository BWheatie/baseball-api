module BattingPostReport
  include BattingReport

  def self.required_attrs
    [:battingpost_games]
  end

  def self.optional_attrs
    [:battingpost_runs, :battingpost_atbats, :battingpost_hits, :battingpost_doubles, :battingpost_triples, :battingpost_homeruns,
    :battingpost_stolenbases, :battingpost_caughtstealing, :battingpost_walks, :battingpost_strikeouts, :battingpost_intentionalwalks,
    :battingpost_hitbypitch, :battingpost_sacbunts, :battingpost_sacflys, :battingpost_gidp, :battingpost_rbi,]
  end

  (self.required_attrs + self.optional_attrs).each do |stat|
    define_method(stat) do
      StatHelper.sum_battingpost_stat(@player, stat)
    end
  end

  def sum_battingpost_stat(stat)
    StatHelper.sum_battingpost_stat(@player, stat)
  end

  def avgpost
    return 0 unless atbatspost >= 1
    hitspost / atbatspost.to_f
  end

  def slgpost
    return 0 unless atbatspost >= 1
    (singlepost + (doublespost*2) + (triplespost*3) + (homerunspost*4)) / atbatspost.to_f
  end

  def obppost
    return 0 unless atbatspost >= 1
    (hitspost + walkspost + hbppost) / (atbatspost + walkspost + hbppost + sacflyspost).to_f
  end

  def opspost
    self.slg + self.obp
  end

  def isopost
    self.slg - self.avg
  end

  def papost
    return 0 unless atbatspost >= 1
    (sacbuntspost + walkspost + hbppost + atbatspost + sacbuntspost).to_f
  end

  def tbpost
    (singlepost + (doublespost*2) + (triples*3) + (homeruns*4)).to_f
  end

  private

  def singlepost
    hitspost - (doublespost + triplespost + homerunspost).to_f
  end

  def hitspost
    sum_battingpost_stat(:battingpost_hits)
  end

  def walkspost
    sum_battingpost_stat(:battingpost_walks)
  end

  def atbatspost
    sum_battingpost_stat(:battingpost_atbats)
  end

  def doublespost
    sum_battingpost_stat(:battingpost_doubles)
  end

  def triplespost
    sum_battingpost_stat(:battingpost_triples)
  end

  def homerunspost
    sum_battingpost_stat(:battingpost_homeruns)
  end

  def sacflyspost
    sum_battingpost_stat(:battingpost_sacflys)
  end

  def sacbuntspost
    sum_battingpost_stat(:battingpost_sacbunts)
  end

  def hbppost
    sum_battingpost_stat(:battingpost_hitbypitch)
  end
end