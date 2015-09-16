class PitchingPostSerializer < ActiveModel::Serializer
  attributes :pitchingpost_games, :pitchingpost_wins, :pitchingpost_losses, :pitchingpost_gamesstarted, :pitchingpost_completegames
  attributes :pitchingpost_shutouts, :pitchingpost_saves, :pitchingpost_ipouts, :pitchingpost_hits, :pitchingpost_earnedruns
  attributes :pitchingpost_homeruns, :pitchingpost_walks, :pitchingpost_strikeouts, :baopppost, :erapost
  attributes :pitchingpost_intentionalwalks, :pitchingpost_wildpitches, :pitchingpost_hitbypitch, :pitchingpost_balk, :pitchingpost_battersfaced
  attributes :pitchingpost_gamesfinished, :pitchingpost_runs, :pitchingpost_sacbunts, :pitchingpost_sacflys, :pitchingpost_gidp
end