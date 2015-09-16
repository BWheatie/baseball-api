module PitchingReport
  def self.required_attrs
    [:pitching_games]
  end

  def self.optional_attrs
    [:pitching_wins, :pitching_losses, :pitching_gamesstarted, :pitching_completegames, :pitching_shutouts, :pitching_saves,
    :pitching_ipouts, :pitching_hits, :pitching_earnedruns, :pitching_homeruns, :pitching_walks, :pitching_strikeouts, :pitching_baopp,
    :pitching_intentionalwalks, :pitching_wildpitches, :pitching_hitbypitch, :pitching_balk, :pitching_battersfaced, :pitching_era,
    :pitching_gamesfinished, :pitching_runs, :pitching_sacbunts, :pitching_sacflys, :pitching_gidp]
  end

  (self.required_attrs + self.optional_attrs).each do |stat|
    define_method(stat) do
      StatHelper.sum_pitching_stat(@player, stat)
    end
  end

  def era
    StatHelper.sum_pitching_stat(@player, :pitching_era) / @player.pitchings.count
  end

  def baopp
    StatHelper.sum_pitching_stat(@player, :pitching_baopp) / @player.pitchings.count
  end

  def whip
    ip = self.ip
    return nil if ip == 0
    pitch = @player.pitchings.pluck(:pitching_walks, :pitching_hits).reject{ |p| p.nil? }
    (pitch.map{|p| p[0] ? p[0] : 0}.reduce(0, :+) + pitch.map{|p| p[1] ? p[1] : 0}.reduce(0, :+)).to_f / ip
  end

  def sO9
    bryce :pitching_strikeouts
  end

  def h9
    bryce :pitching_hits
  end

  def b9
    bryce :pitching_walks
  end

  def ip
    StatHelper.sum_pitching_stat(@player, :pitching_ipouts) / 3
  end

  def bryce stat
    9 * StatHelper.sum_pitching_stat(@player, stat) / self.ip
  end
end