class FieldingPostSerializer < ActiveModel::Serializer
  attributes :fieldingpost_games, :fieldingpost_gamesstarted, :fieldingpost_innouts, :fieldingpost_putouts, :fieldingpost_assists
  attributes :fieldingpost_errors, :fieldingpost_doubleplay, :fieldingpost_passedballs, :fieldingpost_stolenbases, :fieldingpost_caughtstealing
  attributes :fppost
end