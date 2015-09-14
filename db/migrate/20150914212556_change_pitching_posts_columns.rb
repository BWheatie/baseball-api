class ChangePitchingPostsColumns < ActiveRecord::Migration
  def change
    rename_column :pitchingposts, :W, :pitchingpost_wins
    rename_column :pitchingposts, :L, :pitchingpost_losses
    rename_column :pitchingposts, :G, :pitchingpost_games
    rename_column :pitchingposts, :GS, :pitchingpost_gamesstarted
    rename_column :pitchingposts, :CG, :pitchingpost_completegames
    rename_column :pitchingposts, :SHO, :pitchingpost_shutouts
    rename_column :pitchingposts, :SV, :pitchingpost_saves
    rename_column :pitchingposts, :IPouts, :pitchingpost_ipouts
    rename_column :pitchingposts, :H, :pitchingpost_hits
    rename_column :pitchingposts, :ER, :pitchingpost_earnedruns
    rename_column :pitchingposts, :HR, :pitchingpost_homeruns
    rename_column :pitchingposts, :BB, :pitchingpost_walks
    rename_column :pitchingposts, :SO, :pitchingpost_strikeouts
    rename_column :pitchingposts, :BAOpp, :pitchingpost_baopp
    rename_column :pitchingposts, :ERA, :pitchingpost_era
    rename_column :pitchingposts, :IBB, :pitchingpost_intentionalwalks
    rename_column :pitchingposts, :WP, :pitchingpost_wildpitches
    rename_column :pitchingposts, :HBP, :pitchingpost_hitbypitch
    rename_column :pitchingposts, :BK, :pitchingpost_balk
    rename_column :pitchingposts, :BFP, :pitchingpost_battersfaced
    rename_column :pitchingposts, :GF, :pitchingpost_gamesfinished
    rename_column :pitchingposts, :R, :pitchingpost_runs
    rename_column :pitchingposts, :SH, :pitchingpost_sacbunts
    rename_column :pitchingposts, :SF, :pitchingpost_sacflys
    rename_column :pitchingposts, :GIDP, :pitchingpost_gidp
  end
end
