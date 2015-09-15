class PitchingPostSerializer < ActiveModel::Serializer
  attributes :pitchingpost_games, :pitchingpost_wins, :pitchingpost_losses, :pitchingpost_gamesstarted, :pitchingpost_completegames, :pitchingpost_shutouts
  attributes :pitchingpost_saves, :pitchingpost_ipouts, :pitchingpost_hits, :pitchingpost_earnedruns, :pitchingpost_homeruns, :pitchingpost_walks
  attributes :pitchingpost_strikeouts, :pitchingpost_baopp, :pitchingpost_era, :pitchingpost_intentionalwalks, :pitchingpost_wildpitches
  attributes :pitchingpost_hitbypitch, :pitchingpost_balk, :pitchingpost_battersfaced, :pitchingpost_gamesfinished, :pitchingpost_runs, :pitchingpost_sacbunts
  attributes :pitchingpost_sacflys, :pitchingpost_gidp
