module PitchingPostReport
  include PitchingReport

  def self.required_attrs
    [:pitchingpost_games]
  end

  def self.optional_attrs
    [:pitchingpost_wins, :pitchingpost_losses, :pitchingpost_gamesstarted, :pitchingpost_completegames, :pitchingpost_shutouts, :pitchingpost_saves,
    :pitchingpost_ipouts, :pitchingpost_hits, :pitchingpost_earnedruns, :pitchingpost_homeruns, :pitchingpost_walks, :pitchingpost_strikeouts, :pitchingpost_baopp,
    :pitchingpost_era, :pitchingpost_intentionalwalks, :pitchingpost_wildpitches, :pitchingpost_hitbypitch, :pitchingpost_balk, :pitchingpost_battersfaced,
    :pitchingpost_gamesfinished, :pitchingpost_runs, :pitchingpost_sacbunts, :pitchingpost_sacflys, :pitchingpost_gidp]
  end

  (self.required_attrs + self.optional_attrs).each do |stat|
    define_method(stat) do
      StatHelper.sum_pitchingpost_stat(@player, stat)
    end
  end

  def sum_pitchingpost_stat(stat)
    StatHelper.sum_pitchingpost_stat(@player, stat)
  end

  def erapost
    sum_pitchingpost_stat(:pitchingpost_era) / @player.pitchingposts.count.to_f
  end

  def baopppost
    sum_pitchingpost_stat(:pitchingpost_baopp) / @player.pitchingposts.count.to_f
  end

  def whippost
    ip = self.ippost
    return nil if ip == 0
    walks = sum_pitchingpost_stat(:pitchingpost_walks)
    hits = sum_pitchingpost_stat(:pitchingpost_hits)
    (walks + hits) / ip.to_f
  end

  def sO9post
    brycepost :pitchingpost_strikeouts
  end

  def h9post
    brycepost :pitchingpost_hits
  end

  def b9post
    brycepost :pitchingpost_walks
  end

  def ippost
    sum_pitchingpost_stat(:pitchingpost_ipouts).to_f / 3
  end

  def brycepost stat
    return 0 unless self.ip > 0
    9 * sum_pitchingpost_stat(stat) / self.ippost
  end
end