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

  def sum_fielding_stat(fielding)
    fields = @player.fieldings.pluck(fielding).reject{|f| f.nil?}
    fields.reduce(0, :+)
  end

  def fp
    field = @player.fieldings.pluck(:fielding_putouts, :fielding_assists, :fielding_errors)
    (field.map{|f| f[0] ? f[0] : 0}.reduce(0, :+) + field.map{|f| f[1] ? f[1] : 0}.reduce(0, :+)) / (field.map{|f| f[0] ? f[0] : 0}.reduce(0, :+) +
    field.map{|f| f[1] ? f[1] : 0}.reduce(0, :+) + field.map{|f| f[2] ? f[2] : 0}.reduce(0, :+)).to_f
  end
end