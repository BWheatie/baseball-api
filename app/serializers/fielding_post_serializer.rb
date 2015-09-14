class FieldingPostSerializer < ActiveModel::Serializer
  attributes :fieldingpost_games, :fieldingpost_gamesstarted, :fieldingpost_innouts, :fieldingpost_putouts, :fieldingpost_assists, :fieldingpost_errors
  attributes :fieldingpost_doubleplay, :fieldingpost_passedballs, :fieldingpost_stolenbases, :fieldingpost_caughtstealing
end