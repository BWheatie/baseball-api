class PitchingSerializer < ActiveModel::Serializer
  attributes :pitching_games, :pitching_wins, :pitching_losses, :pitching_gamesstarted, :pitching_completegames, :pitching_shutouts
  attributes :pitching_saves, :pitching_ipouts, :pitching_hits, :pitching_earnedruns, :pitching_homeruns, :pitching_walks
  attributes :pitching_strikeouts, :pitching_baopp, :pitching_era, :pitching_intentionalwalks, :pitching_wildpitches
  attributes :pitching_hitbypitch, :pitching_balk, :pitching_battersfaced, :pitching_gamesfinished, :pitching_runs, :pitching_sacbunts
  attributes :pitching_sacflys, :pitching_gidp
end