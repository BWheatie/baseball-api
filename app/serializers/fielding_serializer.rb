class FieldingSerializer < ActiveModel::Serializer
  attributes :fielding_games, :fielding_gamesstarted, :fielding_innouts, :fielding_putouts, :fielding_assists, :fielding_errors
  attributes :fielding_doubleplay, :fielding_passedballs, :fielding_wildpitches, :fielding_stolenbases, :fp
  attributes :fielding_caughtstealing, :fielding_zonerating
end