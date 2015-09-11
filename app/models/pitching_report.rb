module PitchingReport
  def self.required_attrs
    [:G]
  end

  def self.optional_attrs
    [:W, :L, :GS, :CG, :SHO, :SV, :IPouts, :H, :ER, :HR, :BB, :SO, :BAOpp, :ERA, :IBB, :WP, :HBP, :BK, :BFP, :GF, :R, :SH, :SF, :GIDP]
  end

  (self.required_attrs + self.optional_attrs).each do |stat|
    define_method(stat) do
      sum_pitching_stat(stat)
    end
  end

  def sum_pitching_stat(pitching)
    pitch = @player.pitchings.pluck(pitching).reject{ |p| p.nil? }
    pitch.reduce(0, :+)
  end

  def WHIP
    ip = self.IP
    return nil if ip == 0
    pitch = @player.pitchings.pluck(:BB, :H).reject{ |p| p.nil? }
    (pitch.map{|p| p[0] ? p[0] : 0}.reduce(0, :+) + pitch.map{|p| p[1] ? p[1] : 0}.reduce(0, :+)).to_f / ip
  end

#   def SO9
#     return 0 unless IPouts
#     pitch = @player.pitchings.pluck(:SO).reject{ |p| p.nil?}
#     9 * (pitch.map{|p| p[0] ? p[0] : 0}.reduce(0, :+)).to_f / self.IP
#   end

#   def H9
#     pitch = @player.pitchings.pluck(:H).reject{ |p| p.nil?}
#     9 * (pitch.map{|p| p[0] ? p[0] : 0}.reduce(0, :+)).to_f / self.IP
#   end

#   def BB9
#     pitch = @player.pitchings.pluck(:BB).reject{ |p| p.nil?}
#     9 * (pitch.map{|p| p[0] ? p[0] : 0}.reduce(0, :+)).to_f / self.IP
#   end

  def IP
    sum_pitching_stat(:IPouts) / 3
  end
end