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
      StatHelper.sum_batting_stat(@player, stat)
    end
  end

  def avg
    bats = @player.battings.pluck(:batting_hits, :atbats)
    bats.map{|b| b[0] ? b[0] : 0}.reduce(0, :+) / bats.map{|b| b[1] ? b[1] : 0}.reduce(0, :+).to_f
  end

  def slg
    bats = @player.battings.pluck(:batting_doubles, :batting_triples, :batting_homeruns, :atbats)
    (single + (bats.map{|b| b[0] ? b[0] : 0}.reduce(0, :+)*2) + (bats.map{|b| b[1] ? b[1] : 0}.reduce(0, :+)*3) +
    (bats.map{|b| b[2] ? b[2] : 0}.reduce(0, :+)*4)) / (bats.map{|b| b[3] ? b[3] : 0}.reduce(0, :+)).to_f
  end

  def obp
    bats = @player.battings.pluck(:batting_hits, :batting_walk, :batting_hitbypitch, :atbats, :batting_sacfly)
    (bats.map{|b| b[0] ? b[0] : 0}.reduce(0, :+) + bats.map{|b| b[1] ? b[1] : 0}.reduce(0, :+) + bats.map{|b| b[2] ? b[2] : 0}.reduce(0, :+)) /
    (bats.map{|b| b[3] ? b[3] : 0}.reduce(0, :+) + bats.map{|b| b[1] ? b[1] : 0}.reduce(0, :+) + bats.map{|b| b[2] ? b[2] : 0}.reduce(0, :+) +
    bats.map{|b| b[4] ? b[4] : 0}.reduce(0, :+)).to_f
  end

  def ops
    self.slg + self.obp
  end

  def iso
    self.slg - self.avg
  end

  def pa
    bats = @player.battings.pluck(:batting_sacbunt, :batting_walk, :batting_hitbypitch, :atbats, :batting_sacfly)
    bats.map{|b| b[0] ? b[0] : 0}.reduce(0, :+) + bats.map{|b| b[1] ? b[1] : 0}.reduce(0, :+) + bats.map{|b| b[2] ? b[2] : 0}.reduce(0, :+) +
    bats.map{|b| b[3] ? b[3] : 0}.reduce(0, :+) + bats.map{|b| b[4] ? b[4] : 0}.reduce(0, :+).to_f
  end

  def tb
    bats = @player.battings.pluck(:batting_doubles, :batting_triples, :batting_homeruns, :atbats)
    (single + (bats.map{|b| b[0] ? b[0] : 0}.reduce(0, :+)*2) + (bats.map{|b| b[1] ? b[1] : 0}.reduce(0, :+)*3) +
    (bats.map{|b| b[2] ? b[2] : 0}.reduce(0, :+)*4)).to_f
  end

  private
  def single
    bats = @player.battings.pluck(:batting_hits, :batting_doubles, :batting_triples, :batting_homeruns)
    bats.map{|b| b[0] ? b[0] : 0}.reduce(0, :+) - (bats.map{|b| b[1] ? b[1] : 0}.reduce(0, :+) + bats.map{|b| b[2] ? b[2] : 0}.reduce(0, :+) +
    bats.map{|b| b[3] ? b[3] : 0}.reduce(0, :+).to_f)
  end
end