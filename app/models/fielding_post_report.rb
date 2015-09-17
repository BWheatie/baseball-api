module FieldingPostReport
  include FieldingReport
  def self.required_attrs
    [:fieldingpost_games]
  end

  def self.optional_attrs
    [:fieldingpost_gamesstarted, :fieldingpost_innouts, :fieldingpost_putouts, :fieldingpost_assists, :fieldingpost_errors,
    :fieldingpost_doubleplay, :fieldingpost_passedballs, :fieldingpost_wildpitches, :fieldingpost_stolenbases,
    :fieldingpost_caughtstealing, :fieldingpost_zonerating]
  end

  (self.required_attrs + self.optional_attrs).each do |stat|
    define_method(stat) do
      StatHelper.sum_fieldingpost_stat(@player, stat)
    end
  end

  def sum_fieldingpost_stat(stat)
    StatHelper.sum_fieldingpost_stat(@player, stat)
  end

  def fppost
    putouts = sum_fieldingpost_stat(:fieldingpost_putouts)
    assists = sum_fieldingpost_stat(:fieldingpost_assists)
    errors = sum_fieldingpost_stat(:fieldingpost_errors)
    return 0 unless putouts >= 1
    (putouts + assists) / (putouts + assists + errors).to_f
  end
end