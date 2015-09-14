class ChangeBattingPostsColumns < ActiveRecord::Migration
  def change
    rename_column :battingposts, :G, :battingpost_games
    rename_column :battingposts, :AB, :battingpost_atbats
    rename_column :battingposts, :R, :battingpost_runs
    rename_column :battingposts, :H, :battingpost_hits
    rename_column :battingposts, :"2B", :battingpost_doubles
    rename_column :battingposts, :"3B", :battingpost_triples
    rename_column :battingposts, :HR, :battingpost_homeruns
    rename_column :battingposts, :RBI, :battingpost_rbi
    rename_column :battingposts, :SB, :battingpost_stolenbases
    rename_column :battingposts, :CS, :battingpost_caughtstealing
    rename_column :battingposts, :BB, :battingpost_walks
    rename_column :battingposts, :SO, :battingpost_strikeouts
    rename_column :battingposts, :IBB, :battingpost_intentionalwalks
    rename_column :battingposts, :HBP, :battingpost_hitbypitch
    rename_column :battingposts, :SH, :battingpost_sacbunts
    rename_column :battingposts, :SF, :battingpost_sacflys
    rename_column :battingposts, :GIDP, :battingpost_gidp
  end
end
