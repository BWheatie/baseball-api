class PitchingReport < Report
  [:W, :L, :G, :GS, :CG, :SHO, :SV, :IPouts, :H, :ER, :HR, :BB, :SO, :BAOpp, :ERA, :IBB, :WP, :HBP, :BK, :BFP, :GF, :R, :SH, :SF, :GIDP].each do |stat|
    define_method(stat) do
      sum_pitching_stat(stat)
    end
  end

  def sum_pitching_stat(pitching)
    @player.pitchings.pluck(pitching).reduce(:+)
  end

  def pitch_formula(*p)
    @player.pitchings.select(p).map do
      [].reduce(:+)
    end
  end

  def WHIP
    pitch = @player.pitchings.pluck(:BB, :H)
    (pitch.map{|p| p[0]}.reduce(:+) + pitch.map{|p| p[1]}.reduce(:+)).to_f / ip
  end

  def SO9
    pitch = @player.pitchings.pluck(:SO)
    (9 * (pitch.map{|p| p[0]}.reduce(:+)).to_f / IP)
  end

  def H9
    pitch = @player.pitchings.pluck(:H)
    (9 * (pitch.map{|p| p[0]}.reduce(:+)).to_f / IP)
  end

  def BB9
    pitch = @player.pitchings.pluck(:BB)
    (9 * (pitch.map{|p| p[0]}.reduce(:+)).to_f / IP)
  end

  private

  def ip
    pitch_formula(:IPouts) / 3
  end
end