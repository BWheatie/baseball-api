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

  def erapost
    self.era
  end

  def baopppost
    self.baopp
  end

  def whippost
    self.whip
  end

  def sO9post
    self.s09
  end

  def h9post
    self.h9
  end

  def bb9post
    self.bb9
  end
end