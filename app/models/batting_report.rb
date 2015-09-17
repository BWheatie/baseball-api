module BattingReport
  def self.required_attrs
    [:games]
  end

  def self.optional_attrs
    [:atbats, :batting_runs, :batting_hits, :batting_doubles, :batting_triples, :batting_homeruns, :batting_rbi, :batting_stolenbases,
    :batting_caughtstealing, :batting_walk, :batting_strikeout, :batting_intentionalwalks, :batting_hitbypitch, :batting_sacbunt,
    :batting_sacfly, :batting_gidp]
  end

  (self.required_attrs + self.optional_attrs).each do |stat|
    define_method(stat) do
      sum_batting_stat(stat)
    end
  end

  def sum_batting_stat(stat)
    @cache[stat] ||= StatHelper.sum_batting_stat(@player, stat)
  end

  def avg
    return 0 unless atbats > 0
    hits / atbats.to_f
  end

  def slg
    return 0 unless atbats > 0
    (single + (doubles*2) + (triples*3) + (homeruns*4)) / atbats.to_f
  end

  def obp
    return 0 unless atbats > 0
    (hits + walks + hbp) / (atbats + walks + hbp + sacfly).to_f
  end

  def ops
    self.slg + self.obp
  end

  def iso
    self.slg - self.avg
  end

  def pa
    sacbunt + walks + hbp + atbats + sacbunt.to_f
  end

  def tb
    (single + (doubles*2) + (triples*3) + (homeruns*4)).to_f
  end

  private

  def single
    @cache[:single] ||= hits - (doubles + triples + homeruns).to_f
  end

  def hits
    sum_batting_stat(:batting_hits)
  end

  def walks
    sum_batting_stat(:batting_walk)
  end

  def atbats
    sum_batting_stat(:atbats)
  end

  def doubles
    sum_batting_stat(:batting_doubles)
  end

  def triples
    sum_batting_stat(:batting_triples)
  end

  def homeruns
    sum_batting_stat(:batting_homeruns)
  end

  def sacfly
    sum_batting_stat(:batting_sacfly)
  end

  def sacbunt
    sum_batting_stat(:batting_sacbunt)
  end

  def hbp
    sum_batting_stat(:batting_hitbypitch)
  end
end