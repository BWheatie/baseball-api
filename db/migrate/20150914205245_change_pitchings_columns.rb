class ChangePitchingsColumns < ActiveRecord::Migration
  def change
    rename_column :pitchings, :W, :pitching_wins
    rename_column :pitchings, :L, :pitching_losses
    rename_column :pitchings, :G, :pitching_games
    rename_column :pitchings, :GS, :pitching_gamesstarted
    rename_column :pitchings, :CG, :pitching_completegames
    rename_column :pitchings, :SHO, :pitching_shutouts
    rename_column :pitchings, :SV, :pitching_saves
    rename_column :pitchings, :IPouts, :pitching_ipouts
    rename_column :pitchings, :H, :pitching_hits
    rename_column :pitchings, :ER, :pitching_earnedruns
    rename_column :pitchings, :HR, :pitching_homeruns
    rename_column :pitchings, :BB, :pitching_walks
    rename_column :pitchings, :SO, :pitching_strikeouts
    rename_column :pitchings, :BAOpp, :pitching_baopp
    rename_column :pitchings, :ERA, :pitching_era
    rename_column :pitchings, :IBB, :pitching_intentionalwalks
    rename_column :pitchings, :WP, :pitching_wildpitches
    rename_column :pitchings, :HBP, :pitching_hitbypitch
    rename_column :pitchings, :BK, :pitching_balk
    rename_column :pitchings, :BFP, :pitching_battersfaced
    rename_column :pitchings, :GF, :pitching_gamesfinished
    rename_column :pitchings, :R, :pitching_runs
    rename_column :pitchings, :SH, :pitching_sacbunts
    rename_column :pitchings, :SF, :pitching_sacflys
    rename_column :pitchings, :GIDP, :pitching_gidp
  end
end
