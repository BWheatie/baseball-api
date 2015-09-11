module PitchingReport
  def self.required_attrs
    [:G]
  end

  def self.optional_attrs
    [:W, :L, :GS, :CG, :SHO, :SV, :IPouts, :H, :ER, :HR, :BB, :SO, :BAOpp, :ERA, :IBB, :WP, :HBP, :BK, :BFP, :GF, :R, :SH, :SF, :GIDP]
  end

  (self.required_attrs + self.optional_attrs).each do |stat|
    define_method(stat) do
      StatHelper.sum_pitching_stat(@player, stat)
    end
  end

  def WHIP
    ip = self.IP
    return nil if ip == 0
    pitch = @player.pitchings.pluck(:BB, :H).reject{ |p| p.nil? }
    (pitch.map{|p| p[0] ? p[0] : 0}.reduce(0, :+) + pitch.map{|p| p[1] ? p[1] : 0}.reduce(0, :+)).to_f / ip
  end

  def SO9
    bryce :SO
  end

  def H9
    bryce :H
  end

  def BB9
    bryce :BB
  end

  def IP
    StatHelper.sum_pitching_stat(@player, :IPouts) / 3
  end

  def bryce stat
    9 * StatHelper.sum_pitching_stat(@player, stat) / self.IP
  end
end