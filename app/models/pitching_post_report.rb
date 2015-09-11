module PitchingPostReport
  def self.required_attrs
    [:G]
  end

  def self.optional_attrs
    [:W, :L, :GS, :CG, :SHO, :SV, :IPouts, :H, :ER, :HR, :BB, :SO, :BAOpp, :ERA, :IBB, :WP, :HBP, :BK, :BFP, :GF, :R, :SH, :SF, :GIDP]
  end

  (self.required_attrs + self.optional_attrs).each do |stat|
    define_method(stat) do
      sum_pitchingpost_stat(stat)
    end
  end

  def sum_pitchingpost_stat(pitchingpost)
    pitch = @player.pitchingposts.pluck(pitchingpost)
    pitch.reduce(0, :+)
  end

  def WHIPpost
    pitch = @player.pitchingposts.pluck(:BB, :H)
    (pitch.map{|p| p[0] ? p[0] : 0}.reduce(0, :+) + pitch.map{|p| p[1] ? p[1] : 0}.reduce(0, :+)).to_f / ip
  end

  def SO9post
    pitch = @player.pitchingposts.pluck(:SO)
    (9 * (pitch.map{|p| p[0] ? p[0] : 0}.reduce(0, :+)).to_f / ip)
  end

  def H9post
    pitch = @player.pitchingposts.pluck(:H)
    (9 * (pitch.map{|p| p[0] ? p[0] : 0}.reduce(0, :+)).to_f / ip)
  end

  def BB9post
    pitch = @player.pitchingposts.pluck(:BB)
    (9 * (pitch.map{|p| p[0] ? p[0] : 0}.reduce(0, :+)).to_f / ip)
  end

  private

  def IPpost
    sum_pitchingpost_stat(:IPouts) / 3
  end
end