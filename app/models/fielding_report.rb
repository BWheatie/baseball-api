module FieldingReport
  def self.required_attrs
    [:fielding_games]
  end

  def self.optional_attrs
    [:fielding_gamesstarted, :fielding_innouts, :fielding_putouts, :fielding_assists, :fielding_errors,
    :fielding_doubleplay, :fielding_passedballs, :fielding_wildpitches, :fielding_stolenbases,
    :fielding_caughtstealing, :fielding_zonerating]
  end

  (self.required_attrs + self.optional_attrs).each do |stat|
    define_method(stat) do
      StatHelper.sum_fielding_stat(@player, stat)
    end
  end

  def sum_fielding_stat(stat)
    StatHelper.sum_fielding_stat(@player, stat)
  end

  def fp
    putouts = sum_fielding_stat(:fielding_putouts)
    assists = sum_fielding_stat(:fielding_assists)
    errors = sum_fielding_stat(:fielding_errors)
    (putouts + assists) / (putouts + assists + errors).to_f
  end
end