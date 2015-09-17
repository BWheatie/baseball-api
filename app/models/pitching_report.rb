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

  def sum_pitching_stat(stat)
    StatHelper.sum_pitching_stat(@player, stat)
  end

  def era
    return 0 unless @player.pitchings.count > 0
    sum_pitching_stat(:pitching_era) / @player.pitchings.count
  end

  def baopp
    return 0 unless @player.pitchings.count > 0
    sum_pitching_stat(:pitching_baopp) / @player.pitchings.count
  end

  def whip
    ip = self.ip
    return nil if ip == 0
    walks = sum_pitching_stat(:pitching_walks)
    hits = sum_pitching_stat(:pitching_hits)
    (walks + hits).to_f / ip
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
    ipouts = sum_pitching_stat(:pitching_ipouts)
    ipouts.to_f / 3
  end

  def bryce stat
    return 0 unless self.ip > 0
    9 * sum_pitching_stat(stat) / self.ip
  end
end